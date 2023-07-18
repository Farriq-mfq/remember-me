import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:remember_me/app/components/bottom_navigation_bar.dart';
import 'package:remember_me/app/components/card_list.dart';
import 'package:remember_me/app/components/floating_button.dart';
import 'package:remember_me/app/components/table_cl.dart';
import 'package:remember_me/app/controllers/todo_controller.dart';
import 'package:remember_me/utils.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/calender_controller.dart';

class CalenderView extends GetView<CalenderController> {
  const CalenderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final todo_controller = Get.put(TodoController());
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingBtn(),
      appBar: AppBar(
        title: const Text('Calender'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: Get.height,
        child: Column(
          children: [
            Container(
              child: TableCl(),
              color: Color(0xff272727),
            ),
            Expanded(
              child: FutureBuilder(
                future: todo_controller.searchTaskBydate(DateTime.now()),
                builder: (context, snapshot) => todo_controller.obx(
                  (state) => Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          todo_controller.searchTaskBydate(DateTime.now());
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
                            style: TextStyle(
                                color: Color(0xffFFFFFF), fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Tap + to add your tasks",
                            style: TextStyle(
                                color: Color(0xffFFFFFF), fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          IconButton(
                            onPressed: (() {
                              todo_controller.fetchTask();
                              todo_controller.search.clear();
                            }),
                            icon: HeroIcon(HeroIcons.arrowPath,
                                color: Color(0xffFFFFFF)),
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
            ),
          ],
        ),
      ),
    );
  }
}
