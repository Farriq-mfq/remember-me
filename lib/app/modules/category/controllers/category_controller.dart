import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:remember_me/app/data/category_provider.dart';
import 'package:remember_me/app/routes/app_pages.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/IconResponse.dart';
import 'package:remember_me/model/input/category_input.dart';
import 'package:sp_util/sp_util.dart';

class CategoryController extends GetxController
    with StateMixin<List<IconResponse>> {
  // provider
  final CategoryProvider _categoryProvider = CategoryProvider();
  // controller
  late TextEditingController category_name;
  // stete
  Rx<Map<String, dynamic>> validations = Rx<Map<String, dynamic>>({});
  Rx<bool> loading = false.obs;
  Rx<IconResponse> iconState = IconResponse(id: 0, icon: "", iconUrl: "").obs;
  Rx<String> colorState = "".obs;
  @override
  void onInit() {
    category_name = TextEditingController();
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

  @override
  void dispose() {
    category_name.dispose();
    super.dispose();
  }

  void addCategories() {
    loading.value = true;
    setValidations({});
    CategoryInput categoryInput = CategoryInput(
        name: category_name.text,
        idIcon: iconState.value.id != 0 ? iconState.value.id.toString() : "",
        color: colorState.value);
    _categoryProvider.addCategories(categoryInput).then((response) {
      switch (response.statusCode) {
        case 200:
          Get.snackbar("Success", "Berhasil Membuat category",
              backgroundColor: Colors.green, margin: const EdgeInsets.all(20));
          reset();
          break;
        case 400:
          Map<String, dynamic> responseBodyError400 = response.body;
          if (responseBodyError400.containsKey('validations')) {
            setValidations(responseBodyError400['validations']);
          }
          print(validations);
          break;
        case 401:
          SpUtil.remove(Constant.token_key);
          SpUtil.remove(Constant.auth_state_key);
          Get.offAndToNamed(Routes.LOGIN);
          break;
      }
    }).catchError((onError) {
      Get.snackbar(
        "Error",
        "Terjadi Kesalahan",
        icon: HeroIcon(
          HeroIcons.xMark,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(20),
        colorText: Colors.white,
      );
    }).whenComplete(
      () => loading.value = false,
    );
  }

  void setValidations(Map<String, dynamic> validation_val) {
    validations.value = validation_val;
  }

  void fetchIcons() {
    _categoryProvider.getAllIcons().then((response) {
      switch (response.statusCode) {
        case 200:
          List<IconResponse> icons = response.body['icons']
              .map<IconResponse>((icon) => IconResponse.fromJson(icon))
              .toList();
          if (icons.length > 0) {
            change(icons, status: RxStatus.success());
          } else {
            change([], status: RxStatus.empty());
          }
          break;
        case 401:
          SpUtil.remove(Constant.token_key);
          SpUtil.remove(Constant.auth_state_key);
          Get.offAndToNamed(Routes.LOGIN);
          break;
        default:
      }
    }).catchError((onError) {
      print(onError);
      Get.snackbar(
        "Error",
        "Terjadi Kesalahan",
        icon: HeroIcon(
          HeroIcons.xMark,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(20),
        colorText: Colors.white,
      );
      change(null, status: RxStatus.error());
    });
  }

  void selectedIcon(IconResponse icon) {
    iconState.value = icon;
  }

  void selectedColor(String color) {
    colorState.value = color;
  }

  void reset() {
    category_name.text = "";
    iconState.value = IconResponse(id: 0, icon: "", iconUrl: "");
    colorState.value = "";
  }
}
