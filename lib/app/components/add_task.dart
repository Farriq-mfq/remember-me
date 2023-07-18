import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:remember_me/app/controllers/add_task_controller.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/model/category_response.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final add_task_controller = Get.put(AddTaskController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      add_task_controller.reset();
    });
    return Container(
      height: 300,
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
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
                Obx(
                  () => TextField(
                    focusNode: add_task_controller.focusNode,
                    readOnly: add_task_controller.loading.value,
                    controller: add_task_controller.title,
                    autofocus: true,
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    cursorColor: Color(0xffFFFFFF),
                    decoration: InputDecoration(
                      errorText: add_task_controller.validations.value
                              .containsKey('title')
                          ? add_task_controller.validations.value['title'][0]
                          : null,
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
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => TextField(
                    readOnly: add_task_controller.loading.value,
                    controller: add_task_controller.content,
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    maxLines: 2,
                    cursorColor: Color(0xffFFFFFF),
                    decoration: InputDecoration(
                      errorText: add_task_controller.validations.value
                              .containsKey('content')
                          ? add_task_controller.validations.value['content'][0]
                          : null,
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
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Column(
                        children: [
                          IconButton(
                            onPressed: add_task_controller.loading.value
                                ? null
                                : () {
                                    add_task_controller.fetchCategories();
                                    Get.defaultDialog(
                                      title: "Choose Category",
                                      titleStyle: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 16),
                                      titlePadding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
                                      backgroundColor: Color(0xff363636),
                                      content: add_task_controller.obx(
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
                                              final convert_to_hex = int.parse(
                                                  state[index].categoryColor);
                                              return Column(
                                                children: [
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        elevation: 0,
                                                        backgroundColor: Color(
                                                                convert_to_hex)
                                                            .withAlpha(120),
                                                      ),
                                                      onPressed: () {
                                                        add_task_controller
                                                            .selectedCategory(
                                                                state[index]);
                                                        Get.back();
                                                      },
                                                      child: state[index]
                                                                  .icon !=
                                                              null
                                                          ? SvgPicture.network(
                                                              state[index]
                                                                  .icon
                                                                  .iconUrl,
                                                              color: Color(
                                                                  convert_to_hex),
                                                            )
                                                          : SizedBox(),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    state[index].categoryName,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF)),
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
                                            "Terjadi Kesalahan Saat Load Category"),
                                      ),
                                      radius: 5,
                                      confirm: SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.all(14),
                                              backgroundColor:
                                                  Color(0xff8687E7)),
                                          onPressed: () {
                                            Get.toNamed(Routes.CATEGORY);
                                          },
                                          child: Text('Add Category'),
                                        ),
                                      ),
                                    );
                                  },
                            icon: add_task_controller
                                        .selected_category.value.id !=
                                    0
                                ? SvgPicture.network(
                                    add_task_controller
                                        .selected_category.value.icon.iconUrl,
                                    color: Color(
                                      int.parse(add_task_controller
                                          .selected_category
                                          .value
                                          .categoryColor),
                                    ),
                                  )
                                : SvgPicture.asset('assets/icons/tag.svg'),
                            tooltip: "Category",
                          ),
                          add_task_controller.validations.value
                                  .containsKey('id_category')
                              ? Text(
                                  "Category tidak boleh kosong",
                                  style: TextStyle(color: Colors.red),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => IconButton(
                    onPressed: add_task_controller.loading.value
                        ? null
                        : () {
                            add_task_controller.add_task();
                          },
                    icon: add_task_controller.loading.value
                        ? const CircularProgressIndicator(
                            color: Color(0xff8687E7),
                          )
                        : SvgPicture.asset('assets/icons/send.svg'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
