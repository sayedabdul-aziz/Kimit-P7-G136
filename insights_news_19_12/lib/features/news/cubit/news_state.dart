import 'package:insights_news_19_12/core/model/news_model.dart';

class NewsStates {}

class NewsInitState extends NewsStates {}

/// -------- category --------------------
class NewsLoadingState extends NewsStates {}

class NewsSucessState extends NewsStates {
  final NewsModel model;

  NewsSucessState({required this.model});
}

class NewsErrorState extends NewsStates {
  final String error;

  NewsErrorState({required this.error});
}

/// -------- search --------------------

class NewsSearchLoadingState extends NewsStates {}

class NewsSearchSucessState extends NewsStates {
  final NewsModel model;

  NewsSearchSucessState({required this.model});
}

class NewsSearchErrorState extends NewsStates {
  final String error;

  NewsSearchErrorState({required this.error});
}
