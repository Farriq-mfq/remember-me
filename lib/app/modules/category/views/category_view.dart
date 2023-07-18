import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/model/IconResponse.dart';

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
                        Obx(
                          () => TextField(
                            autofocus: true,
                            controller: controller.category_name,
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            cursorColor: Color(0xffFFFFFF),
                            decoration: InputDecoration(
                              errorText: controller.validations.value
                                      .containsKey('name')
                                  ? controller.validations.value['name'][0]
                                  : null,
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
                        Obx(
                          () => controller.iconState.value.id != 0
                              ? Row(
                                  children: [
                                    SvgPicture.network(
                                      controller.iconState.value.iconUrl,
                                      color: Color(0xffFFFFFF),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        controller.iconState.value =
                                            IconResponse(
                                                id: 0,
                                                icon: "",
                                                iconUrl: "iconUrl");
                                      },
                                      icon: HeroIcon(HeroIcons.xMark),
                                      color: Colors.red,
                                    )
                                  ],
                                )
                              : InkWell(
                                  onTap: () {
                                    controller.fetchIcons();
                                    Get.defaultDialog(
                                      title: "Choose Icon",
                                      titleStyle: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 16),
                                      titlePadding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
                                      backgroundColor: Color(0xff363636),
                                      content: controller.obx(
                                        (state) => Container(
                                          height: 300,
                                          width: Get.width,
                                          child: GridView.builder(
                                            itemCount: state!.length,
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
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        elevation: 0,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                      ),
                                                      onPressed: () {
                                                        controller.selectedIcon(
                                                            state[index]);
                                                        Get.back();
                                                      },
                                                      child: state[index]
                                                                  .icon !=
                                                              null
                                                          ? SvgPicture.network(
                                                              state[index]
                                                                  .iconUrl,
                                                              color: Color(
                                                                  0xffFFFFFFF),
                                                            )
                                                          : SizedBox(),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    state[index].icon,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Color(0xffFFFFFF),
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        onLoading: CircularProgressIndicator(
                                          color: Color(0xff8687E7),
                                        ),
                                        onEmpty: Text(
                                          "Category Empty",
                                          style: TextStyle(
                                              color: Color(0xffFFFFFF)),
                                        ),
                                        onError: (error) => Text(
                                            "Terjadi Kesalahan Saat Load Icons"),
                                      ),
                                      radius: 5,
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xff979797),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                        height: 10,
                                      ),
                                      controller.validations.value
                                              .containsKey('id_icon')
                                          ? Text(
                                              controller.validations
                                                  .value['id_icon'][0],
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          : SizedBox(),
                                    ],
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
                        Obx(
                          () => controller.colorState.value.isNotEmpty
                              ? Row(
                                  children: [
                                    Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(int.parse(
                                                controller.colorState.value)))),
                                    IconButton(
                                      onPressed: () {
                                        controller.colorState.value = "";
                                      },
                                      icon: HeroIcon(HeroIcons.xMark),
                                      color: Colors.red,
                                    )
                                  ],
                                )
                              : InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: "Choose Color",
                                      titleStyle: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 16),
                                      backgroundColor: Color(0xff363636),
                                      content: ColorPicker(
                                        enableAlpha: false,
                                        portraitOnly: true,
                                        hexInputBar: true,
                                        showLabel: false,
                                        pickerColor: Color(0xff443a49),
                                        onColorChanged: (value) {
                                          controller.selectedColor(value
                                              .toString()
                                              .substring(6)
                                              .replaceAll(")", ""));
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          child: const Text('Select'),
                                          style: ElevatedButton.styleFrom(
                                            disabledBackgroundColor:
                                                Color.fromARGB(
                                                    129, 135, 117, 255),
                                            elevation: 0,
                                            backgroundColor: Color(0xff8875FF),
                                          ),
                                          onPressed: () {
                                            if (controller
                                                .colorState.value.isNotEmpty) {
                                              Get.back();
                                            }
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xff979797),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "Choose Color",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xffFFFFFF),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      controller.validations.value
                                              .containsKey('color')
                                          ? Text(
                                              controller.validations
                                                  .value['color'][0],
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 10.0),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Back"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              splashFactory: NoSplash.splashFactory,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 40),
                              shadowColor: Colors.transparent),
                        ),
                        ElevatedButton(
                          onPressed: controller.loading.value
                              ? null
                              : () {
                                  controller.addCategories();
                                },
                          child: Text(controller.loading.value
                              ? "Loading..."
                              : "Create Category"),
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor:
                                Color.fromARGB(129, 135, 117, 255),
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
