import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remember_me/app/data/api_provider.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/input/category_input.dart';

class CategoryProvider {
  final box = GetStorage();
  final api_provider = Get.find<ApiProvider>();

  Future<Response<dynamic>> getAllCategories() async {
    final token = box.read(Constant.token_key);
    final Response response = await api_provider
        .get('/categories', headers: {'Authorization': 'Bearer $token'});
    return response;
  }
  Future<Response<dynamic>> getAllIcons() async {
    final token = box.read(Constant.token_key);
    final Response response = await api_provider
        .get('/icons', headers: {'Authorization': 'Bearer $token'});
    return response;
  }

  Future<Response<dynamic>> addCategories(CategoryInput categoryInput) async {
    final token = box.read(Constant.token_key);
    final Response response = await api_provider.post(
        '/categories', categoryInput.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    return response;
  }
}
