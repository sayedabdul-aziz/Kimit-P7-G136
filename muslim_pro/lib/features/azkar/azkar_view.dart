import 'dart:convert';

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:muslim_pro/core/functions/routing.dart';
import 'package:muslim_pro/core/utils/colors.dart';
import 'package:muslim_pro/core/utils/styles.dart';
import 'package:muslim_pro/features/azkar/azkar_details_view.dart';
import 'package:muslim_pro/features/azkar/azkar_model/azkar_model.dart';

class AzkarView extends StatefulWidget {
  const AzkarView({super.key});

  @override
  State<AzkarView> createState() => _AzkarViewState();
}

class _AzkarViewState extends State<AzkarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاذكار والادعية'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/azkar.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List azkarList = json.decode(snapshot.data!);
            List<AzkarModel> azkar =
                azkarList.map((e) => AzkarModel.fromJson(e)).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Scrollbar(
                thickness: 10,
                child: ListView.builder(
                  itemCount: azkar.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: AppColors.primary.withOpacity(.2),
                      margin: const EdgeInsets.all(5),
                      child: ListTile(
                        onTap: () {
                          pushTo(context, AzkarDetailsView(model: azkar[index]));
                        },
                        leading: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/border.png',
                              height: 40,
                              color: AppColors.primary,
                            ),
                            Text(
                                ArabicNumbers().convert((index + 1).toString()),
                                style: getBodyStyle()),
                          ],
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            azkar[index].category.toString(),
                            style: getTitleStyle(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
