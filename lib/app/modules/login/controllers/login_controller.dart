import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons/heroicons.dart';
import 'package:remember_me/app/data/auth_provider.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/input/login_input.dart';
import 'package:remember_me/model/login_response.dart';

class LoginController extends GetxController with StateMixin<dynamic> {
  final AuthProvider _authProvider = AuthProvider();

  late TextEditingController email;
  late TextEditingController password;
  final box = GetStorage();
  late FocusNode focusNode;

  Rx<bool> loading = false.obs;
  Rx<Map<String, dynamic>> validations = Rx<Map<String, dynamic>>({});

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    focusNode = FocusNode();
    super.onInit();
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
    email.dispose();
    password.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void setValidations(Map<String, dynamic> validation_val) {
    validations.value = validation_val;
  }

  void loginAction() {
    loading.value = true;
    setValidations({});
    final LoginInput credentials =
        LoginInput(email: email.text, password: password.text);
    _authProvider.login(credentials).then((res) {
      switch (res.statusCode) {
        case 200:
        print(res.body);
          LoginResponse successResponse = LoginResponse.fromJson(res.body);
          box.write(Constant.token_key, successResponse.token);
          box.write(Constant.auth_state_key, successResponse.authState);
          loading.value = false;
          Get.offAndToNamed(Routes.HOME);
          break;
        case 400:
          Map<String, dynamic> responseBodyError400 = res.body;
          if (responseBodyError400.containsKey('validations')) {
            setValidations(responseBodyError400['validations']);
          }
          break;
        case 401:
          Get.snackbar("Error", "Invalid Email dan password",
              icon: HeroIcon(
                HeroIcons.xMark,
                color: Colors.white,
              ),
              backgroundColor: Colors.red,
              margin: const EdgeInsets.all(20),
              colorText: Colors.white);
          break;
        case 500:
          Get.snackbar("Error", "Terjadi Kesalahan",
              icon: HeroIcon(
                HeroIcons.xMark,
                color: Colors.white,
              ),
              backgroundColor: Colors.red,
              margin: const EdgeInsets.all(20),
              colorText: Colors.white);
          break;
        default:
          Get.snackbar("Error", "Terjadi Kesalahan",
              icon: HeroIcon(
                HeroIcons.xMark,
                color: Colors.white,
              ),
              backgroundColor: Colors.red,
              margin: const EdgeInsets.all(20),
              colorText: Colors.white);
          break;
      }
    }).catchError((onError) {
      print(onError);
    }).whenComplete(() {
      loading.value = false;
      focusNode.requestFocus();
    });
  }

  // void reset() {
  //   email.clear();
  //   password.clear();
  //   confirm_password.clear();
  // }
}
