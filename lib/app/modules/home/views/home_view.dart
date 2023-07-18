import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:remember_me/app/components/add_task.dart';
import 'package:remember_me/app/components/bottom_navigation_bar.dart';
import 'package:remember_me/app/components/card_list.dart';
import 'package:remember_me/app/components/floating_button.dart';
import 'package:remember_me/app/controllers/todo_controller.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/model/todo_response.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final todo_controller = Get.put(TodoController());
    List<String> tabList = ['All', 'Today', 'Completed', "UnCompleted"];
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
          InkWell(
            onTap: () {
              Get.toNamed(Routes.PROFILE);
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyA1O4AFMSucEYLCBcbftnzm33d64O7_HK-xhJkfo8OWWZ6czTYqYI3R9mT1QGAYBrxI&usqp=CAU"),
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: todo_controller.search,
                  onChanged: (value) {
                    todo_controller.searchTask(value);
                  },
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  cursorColor: Color(0xffFFFFFF),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xffFFFFFF)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xffFFFFFF)),
                    ),
                    filled: true,
                    fillColor: Color(0xff1D1D1D),
                    hintText: "Search for your task...",
                    hintStyle: TextStyle(color: Color(0xffAFAFAF)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset("assets/icons/search-normal.svg"),
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
                  child: Obx(
                    () => DropdownButton(
                      value: todo_controller.selectedTab.value,
                      focusColor: Color(0xff1D1D1D),
                      alignment: Alignment.center,
                      style: TextStyle(color: Colors.black),
                      underline: Container(),
                      icon: Container(
                          margin: const EdgeInsets.only(left: 45),
                          child:
                              SvgPicture.asset("assets/icons/arrow-down.svg")),
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
                        todo_controller.setSelectedTab(value ?? "All");
                        todo_controller.fetchTask(value ?? "All");
                      },
                    ),
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
      body: FutureBuilder(
        future: todo_controller.fetchTask(),
        builder: (context, snapshot) => todo_controller.obx(
          (state) => Container(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RefreshIndicator(
                onRefresh: () async {
                  todo_controller.fetchTask();
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
                      todo_controller.fetchTask();
                      todo_controller.search.clear();
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
