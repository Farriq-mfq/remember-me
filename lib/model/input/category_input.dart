import 'dart:convert';

CategoryInput categoryInputFromJson(String str) =>
    CategoryInput.fromJson(json.decode(str));

String categoryInputToJson(CategoryInput data) => json.encode(data.toJson());

class CategoryInput {
  String name;
  String idIcon;
  String color;

  CategoryInput({
    required this.name,
    required this.idIcon,
    required this.color,
  });

  factory CategoryInput.fromJson(Map<String, dynamic> json) => CategoryInput(
        name: json["name"],
        idIcon: json["id_icon"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id_icon": idIcon,
        "color": color,
      };
}
