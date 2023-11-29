import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Stack(
                children: [
                  // image
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR77iOanUEwD6cR1bth7E0y0jnAJCnDH6Zp1Q&usqp=CAU'),
                  ),

                  //badge
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Sayed Abdulaziz',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Flutter Develoepr',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
                height: 20,
                color: Colors.black45,
                indent: 40,
                endIndent: 40,
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 70,
                width: double.infinity,
                alignment: Alignment.center,
                // margin: const EdgeInsets.all(20),
                // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                // margin: const EdgeInsets.fromLTRB(10, 20, 20, 0),
                // margin: const EdgeInsets.only(left: 30),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black, width: 4),
                  color: Colors.blue,
                  // shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(10, 30),
                        spreadRadius: 3,
                        blurRadius: 40)
                  ],
                  borderRadius: BorderRadius.circular(20),
                  // borderRadius: const BorderRadius.only(
                  //     topLeft: Radius.circular(15),
                  //     topRight: Radius.circular(15))
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10),
                    Text('Sayed Abbdul-Aziz'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 40,
              //   child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //           elevation: 0,
              //           backgroundColor: Colors.blue,
              //           foregroundColor: Colors.white),
              //       onPressed: () {},
              //       child: const Text('Upload image')),
              // ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
