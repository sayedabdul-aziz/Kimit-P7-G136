import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_pro/core/utils/colors.dart';
import 'package:muslim_pro/core/utils/styles.dart';
import 'package:muslim_pro/features/azkar/azkar_model/azkar_model.dart';

class AzkarDetailsView extends StatefulWidget {
  const AzkarDetailsView({super.key, required this.model});
  final AzkarModel model;

  @override
  State<AzkarDetailsView> createState() => _AzkarDetailsViewState();
}

class _AzkarDetailsViewState extends State<AzkarDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.category.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Scrollbar(
          thickness: 10,
          child: ListView.builder(
            itemCount: widget.model.body!.length,
            itemBuilder: (context, index) {
              var zekr = widget.model.body![index];
              return Container(
                padding: const EdgeInsets.all(10),
                color: AppColors.primary.withOpacity(.2),
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primary.withOpacity(.1)),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/border.png',
                                height: 40,
                                color: AppColors.primary,
                              ),
                              Text(
                                  ArabicNumbers()
                                      .convert((index + 1).toString()),
                                  style: getBodyStyle()),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.copy)),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.share))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        zekr.zekr.toString(),
                        style: GoogleFonts.cairo(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Divider(),
                    (zekr.description!.isNotEmpty)
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                zekr.description.toString(),
                                style: GoogleFonts.cairo(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primary.withOpacity(.1)),
                      child: Row(
                        children: [
                          Text(
                            zekr.reference.toString(),
                            style: GoogleFonts.cairo(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            'عدد مرات التكرار : ${ArabicNumbers().convert(zekr.count)}',
                            style: GoogleFonts.cairo(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
