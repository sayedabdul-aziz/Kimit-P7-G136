import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter is :',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 30),
            ),
            // buttons
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    if (counter > 0) {
                      setState(() {
                        counter--;
                      });
                    }

                    print(counter);
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                // FloatingActionButton(
                //   mini: true,
                //   onPressed: () {

                //   },
                //   child: const Icon(Icons.restore),
                // ),
                // const SizedBox(width: 20),
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: const Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}



// class CounterScreen extends StatelessWidget {
//   CounterScreen({super.key});

//   int counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter App'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Counter is :',
//               style: TextStyle(fontSize: 22),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               '$counter',
//               style: const TextStyle(fontSize: 30),
//             ),
//             // buttons
//             const SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 FloatingActionButton(
//                   mini: true,
//                   onPressed: () {
//                     counter--;
//                     print(counter);
//                   },
//                   child: const Icon(Icons.remove),
//                 ),
//                 const SizedBox(width: 20),
//                 // FloatingActionButton(
//                 //   mini: true,
//                 //   onPressed: () {

//                 //   },
//                 //   child: const Icon(Icons.restore),
//                 // ),
//                 // const SizedBox(width: 20),
//                 FloatingActionButton(
//                   mini: true,
//                   onPressed: () {
//                     counter++;
//                   },
//                   child: const Icon(Icons.add),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
