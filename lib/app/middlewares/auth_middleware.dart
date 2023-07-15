import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';

class AuthMiddleware extends GetMiddleware {
  final box = GetStorage();
  @override
  RouteSettings? redirect(String? route) {
    final token_key = box.read<String>(Constant.token_key);
    if (token_key == null) {
      return const RouteSettings(name: Routes.LOGIN);
    } else {
      return null;
    }
  }
}
