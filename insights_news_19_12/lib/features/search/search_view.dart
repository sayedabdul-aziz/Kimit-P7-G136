import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_19_12/core/utils/app_colors.dart';
import 'package:insights_news_19_12/core/utils/styles.dart';
import 'package:insights_news_19_12/features/search/widgets/news_list_builder.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Your News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  hintText: 'Search for news',
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: AppColors.containerBg,
                  filled: true),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Total Results : 10',
                    style: getBodyStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const Gap(10),
            const Expanded(child: NewsSearchListBuilder())
          ],
        ),
      ),
    );
  }
}
