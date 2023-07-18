import 'package:get/get.dart';
import 'package:remember_me/app/data/api_provider.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/input/category_input.dart';
import 'package:sp_util/sp_util.dart';

class CategoryProvider {
  final api_provider = Get.find<ApiProvider>();

  Future<Response<dynamic>> getAllCategories() async {
    final token = SpUtil.getString(Constant.token_key);
    final Response response = await api_provider
        .get('/categories', headers: {'Authorization': 'Bearer $token'});
    return response;
  }

  Future<Response<dynamic>> getAllIcons() async {
    final token = SpUtil.getString(Constant.token_key);
    final Response response = await api_provider
        .get('/icons', headers: {'Authorization': 'Bearer $token'});
    return response;
  }

  Future<Response<dynamic>> addCategories(CategoryInput categoryInput) async {
    final token = SpUtil.getString(Constant.token_key);
    final Response response = await api_provider.post(
        '/categories', categoryInput.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    return response;
  }
}
