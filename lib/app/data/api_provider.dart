import 'package:get/get.dart';
import 'package:remember_me/constant.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constant.base_url;
  }
}
