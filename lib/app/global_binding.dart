import 'package:get/get.dart';
import 'package:remember_me/app/controllers/add_task_controller.dart';
import 'package:remember_me/app/data/api_provider.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiProvider>(ApiProvider(), permanent: true);
  }
}
