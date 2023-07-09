import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:remember_me/app/components/add_task.dart';

class FloatingBtn extends StatelessWidget {
  const FloatingBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.bottomSheet(
          AddTask(),
          backgroundColor: Color(0xff363636),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
          isDismissible: true,
        );
      },
      elevation: 0,
      child: SvgPicture.asset("assets/icons/outline/add.svg"),
      backgroundColor: Color(0xff8687E7),
    );
  }
}
