import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  bool status;
  String token;
  String tokenType;
  int expiresIn;
  AuthState authState;

  LoginResponse({
    required this.status,
    required this.token,
    required this.tokenType,
    required this.expiresIn,
    required this.authState,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        token: json["token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        authState: AuthState.fromJson(json["authState"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "authState": authState.toJson(),
      };
}

class AuthState {
  int id;
  String name;
  String email;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  AuthState({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AuthState.fromJson(Map<String, dynamic> json) => AuthState(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}