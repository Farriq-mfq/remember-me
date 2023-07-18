import 'package:get/get.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';
import 'package:sp_util/sp_util.dart';

class ApiProvider extends GetConnect {
  List<String> authPath = [Routes.LOGIN, Routes.REGISTER];

  @override
  void onInit() {
    final token_key = SpUtil.getString(Constant.token_key);
    httpClient.baseUrl = Constant.base_url;
    httpClient.addResponseModifier((request, response) async {
      if (!authPath.contains(Get.currentRoute)) {
        if (token_key != null) {
          if (response.statusCode == 401) {
            SpUtil.remove(Constant.token_key);
            SpUtil.remove(Constant.auth_state_key);
          }
        }
      }
      return response;
    });
  }
}
