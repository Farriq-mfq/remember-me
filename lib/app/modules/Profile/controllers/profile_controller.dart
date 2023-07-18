import 'package:get/get.dart';
import 'package:remember_me/app/data/auth_provider.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';

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
    await _authProvider.logout();
  }
}
