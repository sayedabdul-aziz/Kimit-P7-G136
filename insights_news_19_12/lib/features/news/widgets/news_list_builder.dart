import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_19_12/core/utils/app_colors.dart';
import 'package:insights_news_19_12/core/utils/styles.dart';
import 'package:insights_news_19_12/features/news/cubit/news_cubit.dart';
import 'package:insights_news_19_12/features/news/cubit/news_state.dart';
import 'package:insights_news_19_12/features/news/news_details_view.dart';

class NewsListBuilder extends StatefulWidget {
  const NewsListBuilder(
    this.category, {
    super.key,
  });
  final String category;

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNewsByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsSucessState) {
          var news = state.model;
          return ListView.builder(
            itemCount: news.totalResults,
            itemBuilder: (context, index) {
              var item = news.articles![index];
              return GestureDetector(
                onTap: () async {
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
                              maxLines: 2,
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
          );
        } else {
          return const Text('errrorrr');
        }
      },
    );
  }
}
