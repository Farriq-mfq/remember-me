import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';

class GuestMiddleware extends GetMiddleware {
  final box = GetStorage();
  @override
  RouteSettings? redirect(String? route) {
    final token_key = box.read<String>(Constant.token_key);
    if (token_key != null && token_key.isNotEmpty) {
      return const RouteSettings(name: Routes.HOME);
    } else {
      return null;
    }
  }
}
