import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';
import 'package:sp_util/sp_util.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final token_key = SpUtil.getString(Constant.token_key);
    if (token_key == null) {
      return const RouteSettings(name: Routes.WELCOME);
    } else {
      return null;
    }
  }
}
