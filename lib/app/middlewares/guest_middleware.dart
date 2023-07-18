import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';
import 'package:sp_util/sp_util.dart';

class GuestMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final token_key = SpUtil.getString(Constant.token_key);
    if (token_key != null && token_key.isNotEmpty) {
      return const RouteSettings(name: Routes.HOME);
    } else {
      return null;
    }
  }
}
