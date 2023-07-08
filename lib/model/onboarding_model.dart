// To parse this JSON data, do
//
//     final onboardingModel = onboardingModelFromJson(jsonString);

import 'dart:convert';

OnboardingModel onboardingModelFromJson(String str) =>
    OnboardingModel.fromJson(json.decode(str));

String onboardingModelToJson(OnboardingModel data) =>
    json.encode(data.toJson());

class OnboardingModel {
  String image;
  String title;
  String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  factory OnboardingModel.fromJson(Map<String, dynamic> json) =>
      OnboardingModel(
        image: json["image"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "description": description,
      };
}
