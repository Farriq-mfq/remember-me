import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:remember_me/app/modules/Onboarding/controllers/onboarding_controller.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';
import 'package:sp_util/sp_util.dart';

class OnBoardingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool? onboarding =
        SpUtil.getBool(Constant.on_boarding_key, defValue: false);
    if (onboarding != null) {
      if (onboarding) {
        return null;
      } else {
        return const RouteSettings(name: Routes.ONBOARDING);
      }
    } else {
      return const RouteSettings(name: Routes.ONBOARDING);
    }
  }
}
