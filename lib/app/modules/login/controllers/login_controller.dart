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

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final box = GetStorage();
  FocusNode focusNode = FocusNode();

  Rx<bool> loading = false.obs;
  Rx<Map<String, dynamic>> validations = Rx<Map<String, dynamic>>({});

  @override
  void onInit() {
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
    focusNode.dispose();
    super.dispose();
  }

  void setValidations(Map<String, dynamic> validation_val) {
    validations.value = validation_val;
  }

  void loginAction() async {
    loading.value = true;
    try {
      final LoginInput credentials =
          LoginInput(email: email.text, password: password.text);
      final res = await _authProvider.login(credentials);
      if (res.statusCode == 200) {
        LoginResponse successResponse = LoginResponse.fromJson(res.body);
        await box.write(Constant.token_key, successResponse.token);
        await box.write(Constant.auth_state_key, successResponse.authState);
        loading.value = false;
        Future.delayed(
          Duration(milliseconds: 500),
          () {
            Get.offAndToNamed(Routes.HOME);
          },
        );
      } else {
        switch (res.statusCode) {
          case 400:
            Map<String, dynamic> responseBodyError400 = res.body;
            if (responseBodyError400.containsKey('validations')) {
              setValidations(responseBodyError400['validations']);
            }
            break;
          case 401:
            setValidations({});
            break;
          case 500:
            setValidations({});
            break;
          default:
            setValidations({});
            break;
        }
        loading.value = false;
        focusNode.requestFocus();
      }
    } catch (e) {
      print(e);
      loading.value = false;
      focusNode.requestFocus();
    }
  }

  void _authSnackbar(String message) {
    Get.snackbar("sg", message,
        margin: const EdgeInsets.all(30),
        backgroundColor: Colors.red,
        icon: HeroIcon(
          HeroIcons.xMark,
          color: Color(0xffFFFFFF),
        ),
        isDismissible: true,
        borderColor: Colors.transparent,
        colorText: Color(0xffFFFFFF));
  }
}
