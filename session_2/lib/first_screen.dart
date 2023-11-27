import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            'My Second App',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center, //vert
          children: [
            // Image.network(
            //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR77iOanUEwD6cR1bth7E0y0jnAJCnDH6Zp1Q&usqp=CAU',
            //   fit: BoxFit.cover,
            //   width: 150,
            // ),
            CircleAvatar(
              radius: 62,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/user.jpg'),
              ),
            ),
            // Image.asset(
            //   'assets/user.jpg',
            //   width: 150,
            // ),
            SizedBox(height: 20),
            Text(
              'Sayed Abdul-Aziz',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 15),
            Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.facebook,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.snapchat,
                  color: Colors.red,
                ),
              ],
            )
          ],
        ));
  }
}
