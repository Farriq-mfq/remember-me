import 'package:get/get.dart';
import 'package:remember_me/app/data/api_provider.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/input/login_input.dart';
import 'package:remember_me/model/input/register_input.dart';
import 'package:sp_util/sp_util.dart';

class AuthProvider {
  final _api_provider = Get.find<ApiProvider>();
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
    final token_key = SpUtil.getString(Constant.token_key);

    final Response response = await _api_provider.post('/auth/logout', {},
        headers: {"Authorization": "Bearer ${token_key}"});

    if (response.isOk) {
      await SpUtil.remove(Constant.token_key);
      await SpUtil.remove(Constant.auth_state_key);
      Get.offAndToNamed(Routes.LOGIN);
    }

    return response;
  }
}
