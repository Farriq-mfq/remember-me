import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remember_me/app/data/api_provider.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/input/login_input.dart';

class AuthProvider {
  final api_provider = Get.find<ApiProvider>();
  final box = GetStorage();

  Future<Response<dynamic>> login(LoginInput credentials) async {
    final Response response =
        await api_provider.post('/auth/login', credentials.toJson());
    return response;
  }

  // Future<Response<dynamic>> register(LoginInput credentials) async {
  //   final Response response =
  //       await api_provider.post('/auth/login', credentials.toJson());
  //   return response;
  // }
  Future<Response<dynamic>> logout() async {
    final Response response = await api_provider.post('/auth/logout', {});
    if (response.isOk) {
      await box.remove(Constant.token_key);
      await box.remove(Constant.auth_state_key);
    }
    return response;
  }
}
