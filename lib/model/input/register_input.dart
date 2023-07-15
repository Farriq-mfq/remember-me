import 'dart:convert';

RegisterInput registerInputFromJson(String str) =>
    RegisterInput.fromJson(json.decode(str));

String registerInputToJson(RegisterInput data) => json.encode(data.toJson());

class RegisterInput {
  String nama;
  String email;
  String password;
  String confirmPassword;

  RegisterInput({
    required this.nama,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory RegisterInput.fromJson(Map<String, dynamic> json) => RegisterInput(
        nama: json["nama"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
      };
}
