import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remember_me/app/global_binding.dart';
import 'package:remember_me/app/modules/home/views/home_view.dart';
import 'package:remember_me/app/modules/login/views/login_view.dart';
import 'package:sp_util/sp_util.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(GetMaterialApp(
    title: "Remember Me",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: GoogleFonts.latoTextTheme(),
      scaffoldBackgroundColor: const Color(0xff121212),
    ),
    initialBinding: GlobalBinding(),
  ));
}
