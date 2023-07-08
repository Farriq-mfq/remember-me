import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/model/onboarding_model.dart';

class TabbarComponents extends StatefulWidget {
  final List<OnboardingModel> listOnboardings;
  const TabbarComponents({super.key, required this.listOnboardings});

  @override
  State<TabbarComponents> createState() => _TabbarComponentsState();
}

class _TabbarComponentsState extends State<TabbarComponents>
    with SingleTickerProviderStateMixin {
  List<Widget> _getDotIndicator(int length, [int activeIndex = 0]) {
    List<Widget> listWidget = [];
    for (int i = 0; i < length; i++) {
      Widget bar = Container(
        height: 5,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: activeIndex == i ? Color(0xffFFFFFF) : Color(0xffAFAFAF),
        ),
        margin: const EdgeInsets.only(right: 3),
      );
      listWidget.add(bar);
    }
    return listWidget;
  }

  late TabController _tabController;
  @override
  void initState() {
    _tabController =
        new TabController(vsync: this, length: widget.listOnboardings.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void nextOnbording() {
    if ((_tabController.index + 1) < widget.listOnboardings.length) {
      _tabController.animateTo(_tabController.index + 1);
    } else {
      Get.offAndToNamed(Routes.WELCOME);
    }
  }

  void prevOnbording() {
    if ((_tabController.index + 1) > 1) {
      _tabController.animateTo(_tabController.index - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Container(
              height: Get.height,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 0, top: 40),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.offAndToNamed(Routes.WELCOME);
                          },
                          child: Text("SKIP"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              splashFactory: NoSplash.splashFactory,
                              shadowColor: Colors.transparent),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: widget.listOnboardings.map((onBoarding) {
                        int index = widget.listOnboardings.indexOf(onBoarding);
                        return Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(onBoarding.image),
                                SizedBox(
                                  height: 60,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _getDotIndicator(3, index),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  onBoarding.title,
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  onBoarding.description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffFFFFFF),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40.0, horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: prevOnbording,
                          child: Text("BACK"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              splashFactory: NoSplash.splashFactory,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 40),
                              shadowColor: Colors.transparent),
                        ),
                        ElevatedButton(
                          onPressed: nextOnbording,
                          child: Text("NEXT"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff8875FF),
                            elevation: 0,
                            splashFactory: NoSplash.splashFactory,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            shadowColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      length: widget.listOnboardings.length,
    );
  }
}
