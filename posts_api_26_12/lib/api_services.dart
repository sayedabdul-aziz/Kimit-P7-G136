import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:posts_api_26_12/constants.dart';
import 'package:posts_api_26_12/post_model/post_model.dart';

//1) convert link from string to url (Uri.parse())
//2) call api using (http.get())
//3 Check response.statusCode is equal 200 (Ok)
//4) Convert body of response from string to json using (json.decode())
//5) parse map to post model and return list of model;
class ApiServices {
  static Future<List<PostModel>?> getPostsByHttp() async {
    try {
      print('-------');
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body) as List;
        List<PostModel> posts = data.map((e) => PostModel.fromJson(e)).toList();
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<List<PostModel>?> getPostsByDio() async {
    try {
      print('-------');
      var res =
          await Dio().get(AppConstants.baseUrl + AppConstants.postsEndPoint);
      if (res.statusCode == 200) {
        var data = res.data as List;
        List<PostModel> posts = data.map((e) => PostModel.fromJson(e)).toList();
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
