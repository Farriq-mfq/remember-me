import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:remember_me/app/components/bottom_navigation_bar.dart';
import 'package:remember_me/app/components/card_list.dart';
import 'package:remember_me/app/components/floating_button.dart';
import 'package:remember_me/app/controllers/todo_controller.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool empty = false;
    final todo_controller = Get.put(TodoController());

    return Scaffold(
      bottomNavigationBar: BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingBtn(),
      appBar: AppBar(
        title: const Text('History'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: todo_controller.fetchTask("Completed"),
        builder: (context, snapshot) => todo_controller.obx(
          (state) => Container(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RefreshIndicator(
                onRefresh: () async {
                  todo_controller.fetchTask("Completed");
                },
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return CardList(
                      key: Key(state[index].id.toString()),
                      todo: state[index],
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: state!.length,
                ),
              ),
            ),
          ),
          onEmpty: SingleChildScrollView(
            child: Container(
              width: Get.width,
              child: Column(
                children: [
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
                  SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    onPressed: (() {
                      todo_controller.fetchTask("Completed");
                    }),
                    icon:
                        HeroIcon(HeroIcons.arrowPath, color: Color(0xffFFFFFF)),
                  )
                ],
              ),
            ),
          ),
          onError: (error) {
            return Text(error!);
          },
          onLoading: Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              color: Color(0xff8687E7),
            ),
          ),
        ),
      ),
    );
  }
}
