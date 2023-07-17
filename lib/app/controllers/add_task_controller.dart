import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons/heroicons.dart';
import 'package:remember_me/app/controllers/todo_controller.dart';
import 'package:remember_me/app/data/category_provider.dart';
import 'package:remember_me/app/data/todo_provider.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/category_response.dart';
import 'package:remember_me/model/input/todo_input.dart';

class AddTaskController extends GetxController
    with StateMixin<List<CategoryResponse>> {
  final TodoProvider _todoProvider = TodoProvider();
  final CategoryProvider _categoryProvider = CategoryProvider();
  final todo_controller = Get.put(TodoController());

  // editing
  late TextEditingController title;
  late TextEditingController content;
  late FocusNode focusNode;
  // stete
  Rx<bool> loading = false.obs;
  Rx<CategoryResponse> selected_category = CategoryResponse(
          id: 0, categoryName: "", categoryColor: "categoryColor", icon: null)
      .obs;
  // local storage
  final box = GetStorage();
  Rx<Map<String, dynamic>> validations = Rx<Map<String, dynamic>>({});

  @override
  void onInit() {
    super.onInit();
    title = TextEditingController();
    content = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    title.dispose();
    content.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void add_task() {
    loading.value = true;
    setValidations({});
    TodoInput todoInput = TodoInput(
      title: title.text,
      content: content.text,
      idCategory: selected_category.value.id,
    );
    _todoProvider.postTodo(todoInput).then((response) {
      switch (response.statusCode) {
        case 200:
          Get.snackbar("Success", "Berhasil Membuat task",
              backgroundColor: Colors.green, margin: const EdgeInsets.all(20));
          reset();
          focusNode.requestFocus();
          todo_controller.fetchTask();
          break;
        case 400:
          Map<String, dynamic> responseBodyError400 = response.body;
          if (responseBodyError400.containsKey('validations')) {
            setValidations(responseBodyError400['validations']);
          }
          break;
        case 401:
          box.remove(Constant.token_key);
          box.remove(Constant.auth_state_key);
          Get.offAndToNamed(Routes.LOGIN);
          break;
        default:
      }
    }).catchError((onError) {
      Get.snackbar(
        "Error",
        "Terjadi Kesalahan",
        icon: HeroIcon(
          HeroIcons.xMark,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(20),
        colorText: Colors.white,
      );
    }).whenComplete(
      () => {loading.value = false},
    );
  }

  void selectedCategory(dynamic category) {
    selected_category.value = category;
  }

  void setValidations(Map<String, dynamic> validation_val) {
    validations.value = validation_val;
  }

  void fetchCategories() {
    _categoryProvider.getAllCategories().then((response) {
      switch (response.statusCode) {
        case 200:
          List<CategoryResponse> categories = response.body['categories']
              .map<CategoryResponse>(
                  (category) => CategoryResponse.fromJson(category))
              .toList();
          if (categories.length > 0) {
            change(categories, status: RxStatus.success());
          } else {
            change([], status: RxStatus.empty());
          }
          break;
        case 401:
          box.remove(Constant.token_key);
          box.remove(Constant.auth_state_key);
          Get.offAndToNamed(Routes.LOGIN);
          break;
        default:
      }
    }).catchError((onError) {
      Get.snackbar(
        "Error",
        "Terjadi Kesalahan",
        icon: HeroIcon(
          HeroIcons.xMark,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(20),
        colorText: Colors.white,
      );
      change(null, status: RxStatus.error());
    });
  }

  void reset() {
    title.clear();
    content.clear();
    selected_category.value = CategoryResponse(
        id: 0, categoryName: "", categoryColor: "categoryColor", icon: null);
    setValidations({});
  }
}
