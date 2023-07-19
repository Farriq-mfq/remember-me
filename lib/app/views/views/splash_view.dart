import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remember_me/app/modules/Onboarding/controllers/onboarding_controller.dart';

class SplashView extends GetView {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final onboading_controller = Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: onboading_controller.redirectToWelcome(),
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    "Welcome to remember me",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
