import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Container(
          child: HeroIcon(HeroIcons.bars3BottomRight),
        ),
        actions: [],
      ),
      body: const Center(
        child: Text(
          'HomeView is worksdsdfing',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
