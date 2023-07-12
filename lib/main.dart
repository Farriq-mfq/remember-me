import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remember_me/app/global_binding.dart';

import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';
void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    title: "RememberMe",
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
