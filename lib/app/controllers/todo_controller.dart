import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remember_me/app/data/todo_provider.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/todo_response.dart';

class TodoController extends GetxController
    with StateMixin<List<TodoResponse>> {
  final TodoProvider _todoProvider = TodoProvider();
  final box = GetStorage();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
          box.remove(Constant.token_key);
          box.remove(Constant.auth_state_key);
          Get.offAndToNamed(Routes.LOGIN);
          break;
      }
    }).catchError((onError) {
      change(onError, status: RxStatus.error());
    });
  }
}
