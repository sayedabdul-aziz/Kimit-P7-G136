import 'package:flutter/material.dart';
import 'package:session_4/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int weight = 60;
  int height = 160;
  double res = 0.0;

  String getClass(val) {
    if (val >= 17 && val <= 18.5) {
      return 'Mild Thinness';
    } else if (val > 18.5 && val < 24) {
      return 'Normal';
    } else {
      return 'Overweight';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        // elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColors.scaffoldBg,
        title: Text(
          'BMI Calculator App',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: AppColors.containerBg,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style:
                                TextStyle(color: AppColors.white, fontSize: 20),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '$weight KG',
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: AppColors.grey,
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                backgroundColor: AppColors.grey,
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: AppColors.containerBg,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Height',
                            style:
                                TextStyle(color: AppColors.white, fontSize: 20),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '$height CM',
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: AppColors.grey,
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    height--;
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                backgroundColor: AppColors.grey,
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    height++;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red),
                    onPressed: () {
                      //BMI = mass (kg) /height(2) (m)

                      double result = weight / (height * height * .0001);
                      setState(() {
                        res = result;
                      });
                    },
                    child: const Text('Calculate')),
              ),
            ),

            //result
            Expanded(
              child: SizedBox(
                width: double.infinity,
                // decoration: BoxDecoration(
                //     color: AppColors.containerBg,
                //     borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        res.toStringAsFixed(2),
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        getClass(res),
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
