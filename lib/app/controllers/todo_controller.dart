import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:remember_me/app/data/todo_provider.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/todo_response.dart';
import 'package:sp_util/sp_util.dart';

class TodoController extends GetxController
    with StateMixin<List<TodoResponse>> {
  final TodoProvider _todoProvider = TodoProvider();

  Rx<String> selectedTab = "All".obs;

  late TextEditingController search;

  @override
  void onInit() {
    super.onInit();
    search = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSelectedDate(DateTime date) {
    print(date);
  }

  void setSelectedTab(String tab) {
    selectedTab.value = tab;
  }

  Future<void> fetchTask([String filter = "all"]) async {
    _todoProvider.getAllTodos(filter).then((response) {
      switch (response.statusCode) {
        case 200:
          List<TodoResponse> todos = response.body['todos']
              .map<TodoResponse>((todo) => TodoResponse.fromJson(todo))
              .toList();
          if (todos.length > 0) {
            change(todos, status: RxStatus.success());
          } else {
            change([], status: RxStatus.empty());
          }
          break;
        case 401:
          SpUtil.remove(Constant.token_key);
          SpUtil.remove(Constant.auth_state_key);
          Get.offAndToNamed(Routes.LOGIN);
          break;
      }
    }).catchError((onError) {
      change(onError, status: RxStatus.error());
    });
  }

  Future<void> searchTask(String search) async {
    _todoProvider.searchTodos(search).then((response) {
      switch (response.statusCode) {
        case 200:
          List<TodoResponse> todos = response.body['todos']
              .map<TodoResponse>((todo) => TodoResponse.fromJson(todo))
              .toList();
          if (todos.length > 0) {
            change(todos, status: RxStatus.success());
          } else {
            change([], status: RxStatus.empty());
          }
          break;
        case 401:
          SpUtil.remove(Constant.token_key);
          SpUtil.remove(Constant.auth_state_key);
          Get.offAndToNamed(Routes.LOGIN);
          break;
      }
    }).catchError((onError) {
      change(onError, status: RxStatus.error());
    });
  }

  Future<void> searchTaskBydate(DateTime date) async {
    _todoProvider.searchTodosByDate(date).then((response) {
      switch (response.statusCode) {
        case 200:
          List<TodoResponse> todos = response.body['todos']
              .map<TodoResponse>((todo) => TodoResponse.fromJson(todo))
              .toList();
          if (todos.length > 0) {
            change(todos, status: RxStatus.success());
          } else {
            change([], status: RxStatus.empty());
          }
          break;
        case 401:
          SpUtil.remove(Constant.token_key);
          SpUtil.remove(Constant.auth_state_key);
          Get.offAndToNamed(Routes.LOGIN);
          break;
      }
    }).catchError((onError) {
      change(onError, status: RxStatus.error());
    });
  }

  Future<void> updateTodoStatus(String id) async {
    _todoProvider.updateTodoStatus(id).then((response) {
      switch (response.statusCode) {
        case 200:
          print('success');
          break;
        case 401:
          SpUtil.remove(Constant.token_key);
          SpUtil.remove(Constant.auth_state_key);
          Get.offAndToNamed(Routes.LOGIN);
          break;
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
    });
  }
}
