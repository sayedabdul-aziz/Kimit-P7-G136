import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.menu),
        title: const Text(
          'My First App',
          style: TextStyle(color: Colors.deepOrange),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.deepOrange,
              )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: const Center(
        child: Text(
          'My First App',
          style: TextStyle(
              fontSize: 25,
              letterSpacing: .9,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
