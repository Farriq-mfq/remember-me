import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remember_me/app/components/bottom_navigation_bar.dart';
import 'package:remember_me/app/components/card_list.dart';
import 'package:remember_me/app/components/floating_button.dart';
import 'package:remember_me/app/components/table_cl.dart';
import 'package:remember_me/utils.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/calender_controller.dart';

class CalenderView extends GetView<CalenderController> {
  const CalenderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    // return const CardList();
                    return Text("sd");
                  }),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
