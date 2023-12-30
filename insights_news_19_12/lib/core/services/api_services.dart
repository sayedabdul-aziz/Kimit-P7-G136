import 'package:dio/dio.dart';
import 'package:insights_news_19_12/core/model/news_model.dart';

class ApiServices {
  Future<NewsModel?> getNewsByCategory(String category) async {
    try {
      var res = await Dio().get(
          'https://newsapi.org/v2/top-headlines?apiKey=a8a72be0b04c4e82901e0ae29fe26689&country=us&category=$category');
      if (res.statusCode == 200) {
        var news = NewsModel.fromJson(res.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<NewsModel?> getNewsBySearch(String searchKey) async {
    try {
      var res = await Dio().get(
          'https://newsapi.org/v2/top-headlines?apiKey=a8a72be0b04c4e82901e0ae29fe26689&q=$searchKey');
      if (res.statusCode == 200) {
        var news = NewsModel.fromJson(res.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
