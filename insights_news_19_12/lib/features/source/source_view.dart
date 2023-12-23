import 'package:flutter/material.dart';
import 'package:insights_news_19_12/features/source/widgets/grid_source_item.dart';

class SourceView extends StatefulWidget {
  const SourceView({super.key});

  @override
  State<SourceView> createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Your Source'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            children: const [
              GridSourceItem(),
              GridSourceItem(),
              GridSourceItem(),
              GridSourceItem(),
              GridSourceItem(),
              GridSourceItem(),
            ]),
      ),
    );
  }
}
