import 'package:flutter/material.dart';
import 'package:insights_news_19_12/core/utils/app_colors.dart';
import 'package:insights_news_19_12/core/utils/styles.dart';

class GridSourceItem extends StatelessWidget {
  const GridSourceItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: AppColors.containerBg,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/rodri.jpg',
                height: 120,
                fit: BoxFit.cover,
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ESPN',
                  style:
                      getBodyStyle(fontSize: 16, color: AppColors.whiteColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
