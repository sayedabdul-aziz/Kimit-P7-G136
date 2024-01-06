import 'body.dart';

class AzkarModel {
  String? category;
  List<Body>? body;

  AzkarModel({this.category, this.body});

  factory AzkarModel.fromJson(Map<String, dynamic> json) => AzkarModel(
        category: json['category'] as String?,
        body: (json['body'] as List<dynamic>?)
            ?.map((e) => Body.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'body': body?.map((e) => e.toJson()).toList(),
      };
}
