import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:remember_me/app/components/add_task.dart';
import 'package:remember_me/app/components/bottom_navigation_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(top: 5),
              child: SvgPicture.asset("assets/icons/sort.svg"),
            ),
          ),
        ),
        actions: [
          Container(
            height: 50,
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(),
          )
        ],
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
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
      ),
      body: SingleChildScrollView(
          child: Container(
        width: Get.width,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset("assets/index_empty.png"),
            Text(
              "What do you want to do today?",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Tap + to add your tasks",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
            ),
          ],
        ),
      )),
    );
  }
}
