import 'dart:convert';

TodoResponse todoResponseFromJson(String str) =>
    TodoResponse.fromJson(json.decode(str));

String todoResponseToJson(TodoResponse data) => json.encode(data.toJson());

class TodoResponse {
  List<Datum> data;
  String path;
  int perPage;
  dynamic nextCursor;
  dynamic nextPageUrl;
  dynamic prevCursor;
  dynamic prevPageUrl;

  TodoResponse({
    required this.data,
    required this.path,
    required this.perPage,
    this.nextCursor,
    this.nextPageUrl,
    this.prevCursor,
    this.prevPageUrl,
  });

  factory TodoResponse.fromJson(Map<String, dynamic> json) => TodoResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        nextCursor: json["next_cursor"],
        nextPageUrl: json["next_page_url"],
        prevCursor: json["prev_cursor"],
        prevPageUrl: json["prev_page_url"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "next_cursor": nextCursor,
        "next_page_url": nextPageUrl,
        "prev_cursor": prevCursor,
        "prev_page_url": prevPageUrl,
      };
}

class Datum {
  int id;
  String title;
  String content;
  int pinned;
  DateTime createdAt;
  DateTime updatedAt;
  int idCategory;
  int userId;
  Category category;

  Datum({
    required this.id,
    required this.title,
    required this.content,
    required this.pinned,
    required this.createdAt,
    required this.updatedAt,
    required this.idCategory,
    required this.userId,
    required this.category,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        pinned: json["pinned"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        idCategory: json["id_category"],
        userId: json["user_id"],
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "pinned": pinned,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id_category": idCategory,
        "user_id": userId,
        "category": category.toJson(),
      };
}

class Category {
  int id;
  String categoryName;
  int idIcon;
  String categoryColor;
  DateTime? createdAt;
  DateTime? updatedAt;
  int userId;
  Icon icon;

  Category({
    required this.id,
    required this.categoryName,
    required this.idIcon,
    required this.categoryColor,
    this.createdAt,
    this.updatedAt,
    required this.userId,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["category_name"],
        idIcon: json["id_icon"],
        categoryColor: json["category_color"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        icon: Icon.fromJson(json["icon"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "id_icon": idIcon,
        "category_color": categoryColor,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_id": userId,
        "icon": icon.toJson(),
      };
}

class Icon {
  int id;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;

  Icon({
    required this.id,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        id: json["id"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
