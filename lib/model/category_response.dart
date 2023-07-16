// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromJson(jsonString);

import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) =>
    CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) =>
    json.encode(data.toJson());

class CategoryResponse {
  int id;
  String categoryName;
  String categoryColor;
  dynamic icon;

  CategoryResponse({
    required this.id,
    required this.categoryName,
    required this.categoryColor,
    required this.icon,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        id: json["id"],
        categoryName: json["category_name"],
        categoryColor: json["category_color"],
        icon: Icon.fromJson(json["icon"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_color": categoryColor,
        "icon": icon.toJson(),
      };
}

class Icon {
  int id;
  String icon;
  String iconUrl;

  Icon({
    required this.id,
    required this.icon,
    required this.iconUrl,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        id: json["id"],
        icon: json["icon"],
        iconUrl: json["icon_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "icon_url": iconUrl,
      };
}
