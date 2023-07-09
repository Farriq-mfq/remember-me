import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:remember_me/app/routes/app_pages.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Task",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
                    borderSide: const BorderSide(color: Color(0xffAFAFAF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Color(0xffAFAFAF)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 2,
                cursorColor: Color(0xffFFFFFF),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Desctiption",
                  hintStyle: TextStyle(
                    color: Color(0xffAFAFAF),
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Choose Category",
                        titleStyle:
                            TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                        titlePadding: const EdgeInsets.symmetric(vertical: 15),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        backgroundColor: Color(0xff363636),
                        content: Container(
                          height: 300,
                          width: Get.width,
                          child: GridView.builder(
                            itemCount: 10,
                            // physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 15,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text("s"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text("test")
                                ],
                              );
                            },
                          ),
                        ),
                        radius: 5,
                        confirm: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(14),
                                backgroundColor: Color(0xff8687E7)),
                            onPressed: () {
                              Get.toNamed(Routes.CATEGORY);
                            },
                            child: Text('Add Category'),
                          ),
                        ),
                      );
                    },
                    icon: SvgPicture.asset('assets/icons/tag.svg'),
                    tooltip: "Category",
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/send.svg'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
