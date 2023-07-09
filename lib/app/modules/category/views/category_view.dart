import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remember_me/app/routes/app_pages.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Container(
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          "Create new Category",
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Category name :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          autofocus: true,
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
                                  const BorderSide(color: Color(0xffAFAFAF)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  const BorderSide(color: Color(0xffAFAFAF)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Category icon :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 200,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xff979797),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Choose icon from library",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Category color :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          child: ListView.separated(
                            itemCount: 20,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 7,
                              );
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancel"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            splashFactory: NoSplash.splashFactory,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            shadowColor: Colors.transparent),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Create Category"),
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
    );
  }
}
