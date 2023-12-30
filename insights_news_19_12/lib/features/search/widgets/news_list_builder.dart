import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_19_12/core/model/news_model.dart';
import 'package:insights_news_19_12/core/utils/app_colors.dart';
import 'package:insights_news_19_12/core/utils/styles.dart';
import 'package:insights_news_19_12/features/news/news_details_view.dart';

class NewsSearchListBuilder extends StatelessWidget {
  const NewsSearchListBuilder({
    super.key,
    required this.model,
  });

  final NewsModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                'Total Results : ${model.totalResults}',
                style: getBodyStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        const Gap(10),
        Expanded(
          child: ListView.builder(
            itemCount: model.totalResults,
            itemBuilder: (context, index) {
              var item = model.articles![index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewsDetailsView(model: item),
                  ));
                },
                child: Container(
                  height: 90,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.containerBg),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: (item.urlToImage == null)
                              ? Center(
                                  child: SizedBox(
                                      width: 130,
                                      height: 90,
                                      child: Icon(
                                        Icons.error,
                                        color: AppColors.whiteColor,
                                      )))
                              : Image.network(
                                  item.urlToImage,
                                  width: 130,
                                  height: 90,
                                  fit: BoxFit.cover,
                                )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: getBodyStyle(
                                  fontSize: 12, color: AppColors.whiteColor),
                            ),
                            Text(
                              item.author ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: getBodyStyle(
                                  fontSize: 12, color: AppColors.lemonadaColor),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/read.svg'),
                                const Gap(5),
                                Text(
                                  'Read',
                                  style: getSmallStyle(
                                      fontSize: 10,
                                      color: AppColors.whiteColor),
                                ),
                                const Spacer(),
                                Text(
                                  item.publishedAt!.split('T')[0] ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: getBodyStyle(
                                      fontSize: 12,
                                      color: AppColors.whiteColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
