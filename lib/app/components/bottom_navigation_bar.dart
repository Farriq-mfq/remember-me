import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      fixedColor: Color(0xffFFFFFF),
      unselectedItemColor: Color(0xffFFFFFF),
      backgroundColor: Color(0xff363636),
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        if (value != 2) {
          setState(() {
            index = value;
          });
        }
      },
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _bottomNavItem('home'),
          ),
          label: "Home",
          activeIcon: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _bottomNavItem('home', true),
          ),
        ),
        BottomNavigationBarItem(
          icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _bottomNavItem('calendar')),
          label: "Calender",
          activeIcon: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _bottomNavItem('calendar', true),
          ),
        ),
        BottomNavigationBarItem(
          icon: SizedBox(),
          label: "",
          backgroundColor: Colors.transparent,
          activeIcon: SizedBox(),
          tooltip: "",
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _bottomNavItem('clock'),
          ),
          label: "History",
          activeIcon: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _bottomNavItem('clock', true),
          ),
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _bottomNavItem('user'),
          ),
          label: "Profile",
          activeIcon: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _bottomNavItem('user', true),
          ),
        ),
      ],
    );
  }

  Widget _bottomNavItem(String iconName, [bool isActive = false]) {
    print(ModalRoute.of(context)!.settings.name);
    return Column(
      children: [
        isActive
            ? Container(
                child: SvgPicture.asset("assets/icons/bold/${iconName}.svg"),
              )
            : Container(
                child: SvgPicture.asset("assets/icons/outline/${iconName}.svg"),
              ),
      ],
    );
  }
}
