import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:remember_me/app/components/add_task.dart';
import 'package:remember_me/app/components/bottom_navigation_bar.dart';
import 'package:remember_me/app/components/card_list.dart';
import 'package:remember_me/app/components/floating_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool empty = false;
    List<String> tabList = ['Today', 'Completed', 'Pending'];
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
        bottom: empty
            ? null
            : PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        cursorColor: Color(0xffFFFFFF),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                const BorderSide(color: Color(0xffFFFFFF)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                const BorderSide(color: Color(0xffFFFFFF)),
                          ),
                          filled: true,
                          fillColor: Color(0xff1D1D1D),
                          hintText: "Search for your task...",
                          hintStyle: TextStyle(color: Color(0xffAFAFAF)),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SvgPicture.asset(
                                "assets/icons/search-normal.svg"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff1D1D1D),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        width: 150,
                        child: DropdownButton(
                          value: tabList.first,
                          focusColor: Color(0xff1D1D1D),
                          alignment: Alignment.center,
                          style: TextStyle(color: Colors.black),
                          underline: Container(),
                          icon: Container(
                              margin: const EdgeInsets.only(left: 45),
                              child: SvgPicture.asset(
                                  "assets/icons/arrow-down.svg")),
                          borderRadius: BorderRadius.circular(6),
                          dropdownColor: Color(0xff1D1D1D),
                          elevation: 0,
                          items: tabList.map((e) {
                            return DropdownMenuItem(
                              child: Text(
                                e,
                                style: TextStyle(color: Color(0xffFFFFFF)),
                              ),
                              value: e,
                            );
                          }).toList(),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(150),
              ),
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingBtn(),
      body: Container(
        width: Get.width,
        child: empty
            ? Column(
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
              )
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RefreshIndicator(
                onRefresh: () async {
                  print('s');
                },
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return CardList();
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
      ),
    );
  }
}
