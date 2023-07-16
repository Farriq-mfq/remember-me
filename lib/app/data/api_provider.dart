import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';

class ApiProvider extends GetConnect {
  List<String> authPath = [Routes.LOGIN, Routes.REGISTER];
  final box = GetStorage();

  @override
  void onInit() {
    final token_key = box.read<String>(Constant.token_key);
    httpClient.baseUrl = Constant.base_url;
    httpClient.addResponseModifier((request, response) async {
      if (!authPath.contains(Get.currentRoute)) {
        if (token_key != null) {
          if (response.statusCode == 401) {
            await box.remove(Constant.token_key);
            await box.remove(Constant.auth_state_key);
          }
        }
      }
      return response;
    });
  }
}
