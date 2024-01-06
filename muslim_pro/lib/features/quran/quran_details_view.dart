import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:muslim_pro/core/utils/colors.dart';
import 'package:muslim_pro/core/utils/styles.dart';

class QuranDetailsView extends StatefulWidget {
  const QuranDetailsView({super.key, required this.pageNum});
  final int pageNum;

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  String getPageNum(int page) {
    if (page < 10) {
      return '00$page';
    } else if (page < 100) {
      return '0$page';
    } else {
      return '$page';
    }
  }

  late int currantPage;

  @override
  void initState() {
    super.initState();
    currantPage = widget.pageNum;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: PageView.builder(
                  controller: PageController(initialPage: currantPage),
                  onPageChanged: (value) {
                    setState(() {
                      currantPage = value;
                    });
                  },
                  itemCount: 604,
                  itemBuilder: (context, index) {
                    return Image.asset(
                        'assets/quran-images/page${getPageNum(currantPage)}.png');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.primary.withOpacity(.3)),
                child: Text(ArabicNumbers().convert(currantPage.toString()),
                    style: getTitleStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
