import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: (() => {}),
                            child: Text("LOGIN"),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Color(0xff8875FF),
                              padding: const EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width,
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Color(0xff8875FF))
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Text("CREATE ACCOUNT",textAlign: TextAlign.center,style: TextStyle(color: Color(0xffFFFFFF)),),
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
