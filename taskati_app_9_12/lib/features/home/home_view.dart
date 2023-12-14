import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app_9_12/core/functions/functions.dart';
import 'package:taskati_app_9_12/core/utils/app_colors.dart';
import 'package:taskati_app_9_12/core/utils/styles.dart';
import 'package:taskati_app_9_12/core/widgets/custom_button.dart';
import 'package:taskati_app_9_12/features/create-task/add_task_view.dart';
import 'package:taskati_app_9_12/features/home/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                    // _selectedValue = date;
                  });
                },
              ),
              const Gap(15),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.primaryColor),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Flutter Task - 1',
                                    style: getTitleStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 18),
                                  ),
                                  const Gap(10),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        color: AppColors.whiteColor,
                                      ),
                                      const Gap(10),
                                      Text('02:25 AM - 03:28 PM',
                                          style: getSmallStyle(
                                              color: AppColors.whiteColor))
                                    ],
                                  ),
                                  const Gap(10),
                                  Text('Flutter Task - 1',
                                      style: getBodyStyle(
                                          color: AppColors.whiteColor)),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                width: .5,
                                height: 60,
                                color: AppColors.whiteColor.withOpacity(.5),
                              ),
                              const Gap(10),
                              RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    'TODO',
                                    style: getTitleStyle(
                                        fontSize: 14,
                                        color: AppColors.whiteColor),
                                  ))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Gap(10),
                      itemCount: 2))
            ],
          ),
        ),
      ),
    );
  }
}
