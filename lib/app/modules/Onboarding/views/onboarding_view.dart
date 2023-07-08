import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:remember_me/app/components/tabbar_component.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  List<Widget> _getDotIndicator(int length, [int activeIndex = 0]) {
    List<Widget> listWidget = [];
    for (int i = 0; i < length; i++) {
      Widget bar = Container(
        height: 5,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: activeIndex == i ? Color(0xffFFFFFF) : Color(0xffAFAFAF),
        ),
        margin: const EdgeInsets.only(right: 3),
      );
      listWidget.add(bar);
    }
    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabbarComponents(listOnboardings: controller.onbordingData),
    );
  }
}
