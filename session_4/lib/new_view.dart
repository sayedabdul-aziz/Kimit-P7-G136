import 'package:flutter/material.dart';
import 'package:session_4/colors.dart';
import 'package:session_4/counter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int weight = 60;
  int height = 160;
  double res = 0.0;
  bool isMale = true;

  String getClass(val) {
    if (val >= 17 && val <= 18.5) {
      return 'Mild Thinness';
    } else if (val > 18.5 && val < 24) {
      return 'Normal';
    } else {
      return 'Overweight';
    }
  }

  // (con)? true : fals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CounterScreen(),
              ));
            },
            icon: const Icon(Icons.add_circle_outline_sharp)),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColors.scaffoldBg,
        title: const Text('BMI Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                            color: (isMale)
                                ? AppColors.red
                                : AppColors.containerBg,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Male',
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 20),
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
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                            color: (!isMale)
                                ? AppColors.red
                                : AppColors.containerBg,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Female',
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 20),
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
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                height: 250,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.containerBg,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: TextStyle(color: AppColors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '$height cm',
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Slider(
                        thumbColor: AppColors.red,
                        activeColor: AppColors.red,
                        value: height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                        max: 220,
                        min: 120,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: Row(
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
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 20),
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
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 20),
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
          ],
        ),
      ),
    );
  }
}
