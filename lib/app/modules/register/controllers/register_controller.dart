import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:remember_me/app/data/auth_provider.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/model/input/register_input.dart';

class RegisterController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirm_password;
  late FocusNode focusNode;

  final AuthProvider _authProvider = AuthProvider();
  Rx<Map<String, dynamic>> validations = Rx<Map<String, dynamic>>({});
  Rx<bool> loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirm_password = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirm_password.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void registerAction() {
    loading.value = true;
    setValidations({});
    RegisterInput registerInput = RegisterInput(
        nama: name.text,
        email: email.text,
        password: password.text,
        confirmPassword: confirm_password.text);
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        _authProvider.register(registerInput).then((res) {
          switch (res.statusCode) {
            case 200:
              Get.snackbar("Success", "Berhasil Membuat akun",
                  backgroundColor: Colors.green,
                  margin: const EdgeInsets.all(20));
              reset();
              focusNode.requestFocus();
              Get.toNamed(Routes.LOGIN);
              break;
            case 400:
              Map<String, dynamic> responseBodyError400 = res.body;
              if (responseBodyError400.containsKey('validations')) {
                setValidations(responseBodyError400['validations']);
              }
              break;
            case 500:
              break;
            default:
              break;
          }
        }).catchError((onError) {
          Get.snackbar(
            "Error",
            "Terjadi Kesalahan",
            icon: HeroIcon(
              HeroIcons.xMark,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
            margin: const EdgeInsets.all(20),
            colorText: Colors.white,
          );
        }).whenComplete(() => {loading.value = false});
      },
    );
  }

  void setValidations(Map<String, dynamic> validation_val) {
    validations.value = validation_val;
  }

  void reset() {
    name.clear();
    email.clear();
    password.clear();
    confirm_password.clear();
  }
}
