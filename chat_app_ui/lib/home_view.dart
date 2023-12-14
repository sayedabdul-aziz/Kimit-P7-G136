import 'package:chat_app_ui/colors.dart';
import 'package:chat_app_ui/styles.dart';
import 'package:chat_app_ui/user.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static List<UserModel> users = [
    UserModel(
        image: 'assets/logo.png',
        name: 'Ahmed Rady',
        lastMessage: 'Hello !!',
        time: '12:20 AM'),
    UserModel(
        image: 'assets/logo.png',
        name: 'Mohamed Rady',
        lastMessage: 'Hi !!',
        time: '12:22 AM'),
    UserModel(
        image: 'assets/logo.png',
        name: 'Mohamed Ahmed',
        lastMessage: 'Hiiiiiiiiiii !!',
        time: '11:22 AM'),
    UserModel(
        image: 'assets/logo.png',
        name: 'Sayed Rady',
        lastMessage: 'Hello !!',
        time: '12:22 AM'),
    UserModel(
        image: 'assets/logo.png',
        name: 'Amira Rady',
        lastMessage: 'Hi !!',
        time: '12:22 AM'),
    UserModel(
        image: 'assets/logo.png',
        name: 'Ali Rady',
        lastMessage: 'Hi !!',
        time: '12:22 AM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Chat App',
          style: getTitleStyle(color: AppColors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: AppColors.white,
              )),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Favourite Contacts',
                  style: getTitleStyle(color: AppColors.white, fontSize: 18),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/logo.png'),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              users[index].name.split(' ')[0],
                              style: getTitleStyle(
                                  color: AppColors.white, fontSize: 14),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 5,
                          ),
                      itemCount: users.length),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/logo.png'),
                      ),
                      title: Text(
                        users[index].name,
                        style: getTitleStyle(
                            color: AppColors.primaryColor, fontSize: 18),
                      ),
                      subtitle: Text(
                        users[index].lastMessage,
                      ),
                      trailing: Text(users[index].time),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: users.length),
            ),
          )
        ],
      ),
    );
  }
}
