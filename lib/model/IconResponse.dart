import 'dart:convert';

IconResponse iconResponseFromJson(String str) =>
    IconResponse.fromJson(json.decode(str));

String iconResponseToJson(IconResponse data) => json.encode(data.toJson());

class IconResponse {
  int id;
  String icon;
  String iconUrl;

  IconResponse({
    required this.id,
    required this.icon,
    required this.iconUrl,
  });

  factory IconResponse.fromJson(Map<String, dynamic> json) => IconResponse(
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
