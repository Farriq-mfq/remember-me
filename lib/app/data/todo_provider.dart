import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remember_me/app/data/api_provider.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/input/todo_input.dart';

class TodoProvider {
  final api_provider = Get.find<ApiProvider>();
  final box = GetStorage();

  Future<Response<dynamic>> postTodo(TodoInput todo) async {
    final token = box.read(Constant.token_key);
    final response = await api_provider.post('/todo', todo.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    return response;
  }

  Future<Response<dynamic>> getAllTodos() async {
    final token = box.read(Constant.token_key);
    final response = await api_provider
        .get('/todo', headers: {'Authorization': 'Bearer $token'});
    return response;
  }
}
