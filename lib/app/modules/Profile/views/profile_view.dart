import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remember_me/app/components/bottom_navigation_bar.dart';
import 'package:remember_me/app/components/floating_button.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/login_response.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingBtn(),
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyA1O4AFMSucEYLCBcbftnzm33d64O7_HK-xhJkfo8OWWZ6czTYqYI3R9mT1QGAYBrxI&usqp=CAU"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    box.read<AuthState>(Constant.auth_state_key)!.name,
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width,
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Settings",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xffAFAFAF),
                        fontSize: 14,
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        "App Settings",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                      leading: SvgPicture.asset("assets/icons/setting-2.svg"),
                      trailing: SvgPicture.asset("assets/icons/arrow-left.svg"),
                    ),
                    Text(
                      "Settings",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xffAFAFAF),
                        fontSize: 14,
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        "Change account name",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                      leading: SvgPicture.asset("assets/icons/user.svg"),
                      trailing: SvgPicture.asset("assets/icons/arrow-left.svg"),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        "Change account password",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                      leading: SvgPicture.asset("assets/icons/key.svg"),
                      trailing: SvgPicture.asset("assets/icons/arrow-left.svg"),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        "Change account Image",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                      leading: SvgPicture.asset("assets/icons/camera.svg"),
                      trailing: SvgPicture.asset("assets/icons/arrow-left.svg"),
                    ),
                    Text(
                      "Uptodo",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xffAFAFAF),
                        fontSize: 14,
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        "About US",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                      leading: SvgPicture.asset("assets/icons/menu.svg"),
                      trailing: SvgPicture.asset("assets/icons/arrow-left.svg"),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        "FAQ",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                      leading: SvgPicture.asset("assets/icons/info-circle.svg"),
                      trailing: SvgPicture.asset("assets/icons/arrow-left.svg"),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        "Help & Feedback",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                      leading: SvgPicture.asset("assets/icons/flash.svg"),
                      trailing: SvgPicture.asset("assets/icons/arrow-left.svg"),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        "Support US",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                      leading: SvgPicture.asset("assets/icons/like.svg"),
                      trailing: SvgPicture.asset("assets/icons/arrow-left.svg"),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      onTap: () async {
                        await controller.signOut();
                      },
                      title: Text(
                        "Log out",
                        style: TextStyle(
                          color: Color(0xffFF4949),
                          fontSize: 16,
                        ),
                      ),
                      leading: SvgPicture.asset("assets/icons/logout.svg"),
                      trailing: SvgPicture.asset("assets/icons/arrow-left.svg"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
