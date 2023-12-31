import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:remember_me/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Get.offAndToNamed(Routes.WELCOME);
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(top: 5),
              child: SvgPicture.asset("assets/icons/Back_Button.svg"),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      readOnly: controller.loading.value,
                      focusNode: controller.focusNode,
                      controller: controller.name,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      cursorColor: Color(0xffFFFFFF),
                      decoration: InputDecoration(
                        errorText:
                            controller.validations.value.containsKey('nama')
                                ? controller.validations.value['nama'][0]
                                : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Color(0xff979797)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Color(0xffFFFFFF)),
                        ),
                        filled: true,
                        fillColor: Color(0xff1D1D1D),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      readOnly: controller.loading.value,
                      controller: controller.email,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      cursorColor: Color(0xffFFFFFF),
                      decoration: InputDecoration(
                        errorText:
                            controller.validations.value.containsKey('email')
                                ? controller.validations.value['email'][0]
                                : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Color(0xff979797)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Color(0xffFFFFFF)),
                        ),
                        filled: true,
                        fillColor: Color(0xff1D1D1D),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      readOnly: controller.loading.value,
                      controller: controller.password,
                      obscureText: true,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      cursorColor: Color(0xffFFFFFF),
                      decoration: InputDecoration(
                        errorText:
                            controller.validations.value.containsKey('password')
                                ? controller.validations.value['password'][0]
                                : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Color(0xff979797)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Color(0xffFFFFFF)),
                        ),
                        filled: true,
                        fillColor: Color(0xff1D1D1D),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm Password",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      readOnly: controller.loading.value,
                      controller: controller.confirm_password,
                      obscureText: true,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      cursorColor: Color(0xffFFFFFF),
                      decoration: InputDecoration(
                        errorText: controller.validations.value
                                .containsKey('confirm_password')
                            ? controller.validations.value['confirm_password']
                                [0]
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Color(0xff979797)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Color(0xffFFFFFF)),
                        ),
                        filled: true,
                        fillColor: Color(0xff1D1D1D),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: controller.loading.value
                        ? null
                        : () => {controller.registerAction()},
                    child: Text(
                        controller.loading.value ? "Loading..." : "Register"),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      disabledBackgroundColor:
                          Color.fromARGB(129, 135, 117, 255),
                      backgroundColor: Color(0xff8875FF),
                      padding: const EdgeInsets.all(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        color: Color(0xff979797),
                        height: 1,
                      ),
                      Positioned(
                        child: Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: Text(
                            "or",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: (() {
                    Get.toNamed(Routes.LOGIN);
                  }),
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: Color(0xff979797),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
