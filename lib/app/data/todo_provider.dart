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

  Future<Response<dynamic>> updateTodo(TodoInput todo, String id) async {
    final token = box.read(Constant.token_key);
    final response = await api_provider.patch('/todo/$id', todo.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    return response;
  }

  Future<Response<dynamic>> deleteTodo(String id) async {
    final token = box.read(Constant.token_key);
    final response = await api_provider
        .delete('/todo/$id', headers: {'Authorization': 'Bearer $token'});
    return response;
  }

  Future<Response<dynamic>> getAllTodos(String filter) async {
    final token = box.read(Constant.token_key);
    String requestUrl = _parseUrlByFilter(filter);
    final response = await api_provider
        .get(requestUrl, headers: {'Authorization': 'Bearer $token'});
    return response;
  }

  Future<Response<dynamic>> searchTodos(String search) async {
    final token = box.read(Constant.token_key);
    final response = await api_provider.get('/todo?search=$search',
        headers: {'Authorization': 'Bearer $token'});
    return response;
  }

  Future<Response<dynamic>> searchTodosByDate(DateTime date) async {
    final token = box.read(Constant.token_key);
    final response = await api_provider.get(
        '/todo?filter=date&date=${date.year.toString()}-${date.month.toString()}-${date.day.toString()}',
        headers: {'Authorization': 'Bearer $token'});
    return response;
  }

  Future<Response<dynamic>> updateTodoStatus(String id) async {
    final token = box.read(Constant.token_key);
    final response = await api_provider.patch('/todo/pinned/$id', {},
        headers: {'Authorization': 'Bearer $token'});
    return response;
  }

  String _parseUrlByFilter(String filter) {
    switch (filter) {
      case "All":
        return '/todo';
      case "Today":
        return "/todo?filter=today";
      case "Completed":
        return "/todo?filter=completed";
      case "UnCompleted":
        return "/todo?filter=uncomplted";
      default:
        return '/todo';
    }
  }
}
