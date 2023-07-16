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
  dynamic emailVerifiedAt;
  dynamic createdAt;
  dynamic updatedAt;

  AuthState({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory AuthState.fromJson(Map<String, dynamic> json) => AuthState(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
