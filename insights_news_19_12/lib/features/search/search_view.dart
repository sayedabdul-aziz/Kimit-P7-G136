import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_19_12/core/utils/app_colors.dart';
import 'package:insights_news_19_12/core/utils/styles.dart';
import 'package:insights_news_19_12/features/news/cubit/news_cubit.dart';
import 'package:insights_news_19_12/features/news/cubit/news_state.dart';
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
      body: BlocBuilder<NewsCubit, NewsStates>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  style: getBodyStyle(),
                  onChanged: (value) {
                    context.read<NewsCubit>().getNewsBySearch(value);
                  },
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
                Expanded(child: BlocBuilder<NewsCubit, NewsStates>(
                  builder: (context, state) {
                    if (state is NewsSearchSucessState) {
                      return NewsSearchListBuilder(
                        model: state.model,
                      );
                    } else if (state is NewsLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off_rounded,
                              size: 50,
                              color: AppColors.lemonadaColor,
                            ),
                            Text(
                              'No Search data',
                              style: getBodyStyle(),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
