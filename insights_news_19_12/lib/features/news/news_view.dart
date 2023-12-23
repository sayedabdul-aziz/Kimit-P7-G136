import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_19_12/features/news/widgets/home_header.dart';
import 'package:insights_news_19_12/features/news/widgets/news_categry.dart';
import 'package:insights_news_19_12/features/news/widgets/news_slider.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: HomeHeaderWidget(),
          ),
          NewsImageSlider(),
          Gap(10),
          NewsCategoryWidget(),
        ],
      ),
    );
  }
}
