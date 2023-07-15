import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remember_me/app/data/api_provider.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/input/login_input.dart';
import 'package:remember_me/model/input/register_input.dart';

class AuthProvider {
  final _api_provider = Get.find<ApiProvider>();
  final box = GetStorage();
  Future<Response<dynamic>> login(LoginInput credentials) async {
    final Response response =
        await _api_provider.post('/auth/login', credentials.toJson());
    return response;
  }

  Future<Response<dynamic>> register(RegisterInput credentials) async {
    final Response response =
        await _api_provider.post('/auth/register', credentials.toJson());
    return response;
  }

  Future<Response<dynamic>> logout() async {
    final token_key = box.read<String>(Constant.token_key);

    final Response response = await _api_provider.post('/auth/logout', {},
        headers: {"Authorization": "Bearer ${token_key}"});

    if (response.isOk) {
      await box.remove(Constant.token_key);
      await box.remove(Constant.auth_state_key);
      Get.offAndToNamed(Routes.LOGIN);
    }

    return response;
  }
}
