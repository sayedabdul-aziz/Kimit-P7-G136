import 'package:counter_with_cubit/cubit/counter_cubit.dart';
import 'package:counter_with_cubit/cubit/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterStates>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.read<CounterCubit>().counter.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          context.read<CounterCubit>().remove();
                        },
                        child: const Icon(Icons.remove),
                      ),
                      const Gap(20),
                      FloatingActionButton(
                        onPressed: () {
                          context.read<CounterCubit>().add();
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
