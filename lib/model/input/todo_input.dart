import 'dart:convert';

TodoInput todoInputFromJson(String str) => TodoInput.fromJson(json.decode(str));

String todoInputToJson(TodoInput data) => json.encode(data.toJson());

class TodoInput {
  String title;
  String content;
  String idCategory;

  TodoInput({
    required this.title,
    required this.content,
    required this.idCategory,
  });

  factory TodoInput.fromJson(Map<String, dynamic> json) => TodoInput(
        title: json["title"],
        content: json["content"],
        idCategory: json["id_category"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "id_category": idCategory,
      };
}
