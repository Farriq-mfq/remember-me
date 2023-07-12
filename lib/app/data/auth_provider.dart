import 'package:get/get.dart';
import 'package:remember_me/app/data/api_provider.dart';
import 'package:remember_me/model/input/login_input.dart';

class AuthProvider {
  final api_provider = Get.find<ApiProvider>();

  Future<Response<dynamic>> login(LoginInput credentials) async {
    final Response response =
        await api_provider.post('/auth/login', credentials.toJson());
    return response;
  }
}
