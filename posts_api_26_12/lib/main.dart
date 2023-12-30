import 'package:flutter/material.dart';
import 'package:posts_api_26_12/posts_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostsView(),
    );
  }
}
