import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app_9_12/core/functions/functions.dart';
import 'package:taskati_app_9_12/core/storage/task_model.dart';
import 'package:taskati_app_9_12/core/utils/app_colors.dart';
import 'package:taskati_app_9_12/core/utils/styles.dart';
import 'package:taskati_app_9_12/core/widgets/custom_button.dart';
import 'package:taskati_app_9_12/features/create-task/add_task_view.dart';
import 'package:taskati_app_9_12/features/home/widgets/home_header.dart';
import 'package:taskati_app_9_12/features/home/widgets/task_card_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _selectedDate = DateFormat.yMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const HomeHeaderWidget(),
              const Gap(15),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.MMMMEEEEd().format(DateTime.now()),
                        style: getTitleStyle(fontSize: 18),
                      ),
                      Text(
                        'Today',
                        style: getTitleStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                      style: getSmallStyle(color: AppColors.whiteColor),
                      width: 120,
                      text: '+ Add Task',
                      onTap: () {
                        push(context, const AddTaskView());
                      }),
                ],
              ),
              const Gap(15),
              DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedDate = DateFormat.yMd().format(date);
                  });
                },
              ),
              const Gap(15),
              Expanded(
                  child: ValueListenableBuilder<Box<Task>>(
                valueListenable: Hive.box<Task>('task').listenable(),
                builder: (context, Box<Task> value, child) {
                  List<Task> tasks = [];

                  for (var element in value.values) {
                    if (_selectedDate == element.date) {
                      tasks.add(element);
                    }
                  }
                  if (tasks.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/empty.png'),
                          const Gap(20),
                          Text(
                            'No Tasks, Create your task now !!',
                            style: getTitleStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        //
                        Task item = tasks[index];
                        //
                        return Dismissible(
                            key: UniqueKey(),
                            secondaryBackground: Container(
                              padding: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  color: AppColors.redColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: AppColors.whiteColor,
                                  ),
                                  const Gap(10),
                                  Text(
                                    'Delete Task',
                                    style: getSmallStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor),
                                  ),
                                ],
                              ),
                            ),
                            background: Container(
                              padding: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  color: AppColors.greenColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.done,
                                    color: AppColors.whiteColor,
                                  ),
                                  const Gap(10),
                                  Text(
                                    'Complete Task',
                                    style: getSmallStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor),
                                  ),
                                ],
                              ),
                            ),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.startToEnd) {
                                value.put(
                                    item.id,
                                    Task(
                                        id: item.id,
                                        title: item.title,
                                        note: item.note,
                                        date: item.date,
                                        startTime: item.startTime,
                                        endTime: item.endTime,
                                        color: item.color,
                                        isComplete: true));
                              } else {
                                value.delete(item.id);
                              }
                            },
                            child: TaskCardItem(model: item));
                      },
                      separatorBuilder: (context, index) => const Gap(10),
                      itemCount: tasks.length);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
