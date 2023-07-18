import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 80),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            "Welcome to RememberMe",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Please login to your account or create new account to continue",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: () => {Get.toNamed(Routes.LOGIN)},
                            child: Text("LOGIN"),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Color(0xff8875FF),
                              padding: const EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: () => {Get.toNamed(Routes.REGISTER)},
                            child: Text(
                              "CREATE ACCOUNT",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xffFFFFFF)),
                            ),
                            style: OutlinedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              side: const BorderSide(color: Color(0xff8875FF)),
                              padding: const EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
