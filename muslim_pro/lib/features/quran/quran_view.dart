import 'dart:convert';

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_pro/core/functions/routing.dart';
import 'package:muslim_pro/core/utils/colors.dart';
import 'package:muslim_pro/core/utils/styles.dart';
import 'package:muslim_pro/features/quran/quran_details_view.dart';
import 'package:muslim_pro/features/quran/quran_model/quran_model.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القرآن الكريم'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/quran.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List quranList = json.decode(snapshot.data!);
            List<QuranModel> quran =
                quranList.map((e) => QuranModel.fromJson(e)).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                itemCount: quran.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: AppColors.primary.withOpacity(.2),
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      onTap: () {
                        pushTo(
                            context,
                            QuranDetailsView(
                              pageNum: quran[index].ayahs![0].page!,
                            ));
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
                              ArabicNumbers()
                                  .convert(quran[index].number.toString()),
                              style: getBodyStyle()),
                        ],
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          quran[index].name.toString(),
                          style: GoogleFonts.amiriQuran(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      subtitle: Text(
                          'عدد الايات : ${ArabicNumbers().convert(quran[index].ayahs!.length.toString())}'),
                      trailing: Text(
                        quran[index].revelationType.toString(),
                        style: getTitleStyle(fontSize: 14),
                      ),
                    ),
                  );
                },
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
