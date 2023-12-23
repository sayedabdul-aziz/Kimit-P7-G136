import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news_19_12/core/functions/functions.dart';
import 'package:insights_news_19_12/core/storage/local_storage.dart';
import 'package:insights_news_19_12/core/utils/app_colors.dart';
import 'package:insights_news_19_12/core/utils/styles.dart';
import 'package:insights_news_19_12/core/widgets/custom_button.dart';
import 'package:insights_news_19_12/features/home/nav_bar.dart';

String? imagePath;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (imagePath != null && name.isNotEmpty) {
                  AppLocalStorage.cacheData(AppLocalStorage.IS_UPLOAD, true);
                  AppLocalStorage.cacheData(
                      AppLocalStorage.Image_Key, imagePath!);
                  AppLocalStorage.cacheData(AppLocalStorage.Name_Key, name);
                  pushWithReplacment(context, const HomeView());
                } else if (imagePath != null && name.isEmpty) {
                  showErrorWidget(context, 'Please Enter Your Name');
                } else if (imagePath == null && name.isNotEmpty) {
                  showErrorWidget(context, 'Please Enter Your Image');
                } else {
                  showErrorWidget(
                      context, 'Please Enter Your Name and Your Image');
                }
              },
              child: Text(
                'Done',
                style: getBodyStyle(color: AppColors.lemonadaColor),
              ))
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.lemonadaColor,
              backgroundImage: (imagePath != null)
                  ? FileImage(File(imagePath!)) as ImageProvider
                  : const AssetImage('assets/user.png'),
            ),
            const Gap(20),
            CustomButton(
              text: 'Upload from Camera',
              width: 260,
              onTap: () {
                _uploadFromCamera();
              },
            ),
            const Gap(10),
            CustomButton(
              text: 'Upload from Gallery',
              width: 260,
              onTap: () {
                _uploadFromGallery();
              },
            ),
            const Gap(10),
            const Divider(),
            const Gap(10),
            TextFormField(
              style: getBodyStyle(),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
                print(name);
              },
              decoration: const InputDecoration(
                hintText: 'Enter Your Name',
              ),
            ),
          ],
        ),
      )),
    );
  }

  //A>B>C
  //

  _uploadFromCamera() async {
    // open camera and picked image or not
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }

  _uploadFromGallery() async {
    // open camera and picked image or not
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }
}
