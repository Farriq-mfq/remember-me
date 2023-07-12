import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';

class OnboardingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();
    bool show_onboarding = box.read(Constant.on_boarding_key) ?? false;
    if (show_onboarding) {
      return const RouteSettings(name: Routes.WELCOME);
    } else {
      return null;
    }
  }
}
