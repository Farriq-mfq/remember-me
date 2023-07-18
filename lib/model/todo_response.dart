
import 'dart:convert';

TodoResponse todoResponseFromJson(String str) => TodoResponse.fromJson(json.decode(str));

String todoResponseToJson(TodoResponse data) => json.encode(data.toJson());

class TodoResponse {
    int id;
    String title;
    String content;
    int pinned;
    DateTime createdAt;
    Category category;

    TodoResponse({
        required this.id,
        required this.title,
        required this.content,
        required this.pinned,
        required this.createdAt,
        required this.category,
    });

    factory TodoResponse.fromJson(Map<String, dynamic> json) => TodoResponse(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        pinned: json["pinned"],
        createdAt: DateTime.parse(json["created_at"]),
        category: Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "pinned": pinned,
        "created_at": createdAt.toIso8601String(),
        "category": category.toJson(),
    };
}

class Category {
    int id;
    String categoryName;
    String categoryColor;
    Icon icon;

    Category({
        required this.id,
        required this.categoryName,
        required this.categoryColor,
        required this.icon,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
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
