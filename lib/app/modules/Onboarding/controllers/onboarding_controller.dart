import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:remember_me/model/onboarding_model.dart';

class OnboardingController extends GetxController {
  List<OnboardingModel> onbordingData = [
    OnboardingModel(
        image: "assets/onboarding_01.png",
        title: "Manage your tasks",
        description:
            "You can easily manage all of your daily tasks in DoMe for free"),
    OnboardingModel(
        image: "assets/onboarding_02.png",
        title: "Create daily routine",
        description:
            "In Uptodo  you can create your personalized routine to stay productive"),
    OnboardingModel(
        image: "assets/onboarding_03.png",
        title: "Orgonaize your tasks",
        description:
            "You can organize your daily tasks by adding your tasks into separate categories"),
  ];

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
    super.dispose();
  }
}
