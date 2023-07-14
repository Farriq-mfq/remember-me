import 'package:get/get.dart';
import 'package:remember_me/app/data/auth_provider.dart';
import 'package:remember_me/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final AuthProvider _authProvider = AuthProvider();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> signOut() async {
    final res = await _authProvider.logout();
    if (res.isOk) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
