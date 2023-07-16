import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remember_me/app/data/todo_provider.dart';
import 'package:remember_me/model/todo_response.dart';

class HomeController extends GetxController with StateMixin<TodoResponse> {
  final TodoProvider _todoProvider = TodoProvider();
  // local storage
  final box = GetStorage();

  // controller
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    fetchTask();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchTask() {
    _todoProvider.getAllTodos().then((response) {
      TodoResponse todos = TodoResponse.fromJson(response.body['todos']);
      change(todos, status: RxStatus.success());
    }).catchError((onError) {
      print(onError);
    });
  }
}
