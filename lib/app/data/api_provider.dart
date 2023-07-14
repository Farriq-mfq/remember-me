import 'package:get/get.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';

class ApiProvider extends GetConnect {
  List<String> authPath = [Routes.LOGIN, Routes.REGISTER];

  @override
  void onInit() {
    httpClient.baseUrl = Constant.base_url;
    httpClient.addResponseModifier((request, response) async {
      // if (!authPath.contains(Get.currentRoute)) {
      //   print(response.statusCode);
      // } else {
      //   print("AUTH PAGE");
      // }

      return response;
    });
  }
}
