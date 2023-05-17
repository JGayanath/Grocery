import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery/screens/home/home_screen.dart';
import 'package:grocery/screens/main/favouritse/favouritse.dart';
import 'package:grocery/screens/main/oders/oders.dart';
import 'package:grocery/screens/profile/profile.dart';
import 'package:grocery/utils/app_colors.dart';
import 'package:grocery/utils/assets_constant.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({Key? key}) : super(key: key);

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  // start active index
  int activeIndex = 0;

  //---Screen list
  final List<Widget> _screen_list = [
     Home_Screen(),
     Favouritse(),
     Oders(),
     Profile_page(),

  ];

  //change active index
  void onItemTap(int value) {
    setState(() {
      activeIndex=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen_list[activeIndex],
        bottomNavigationBar: SizedBox(
      height: 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavBarTile(
            icon: AssetsPath.home,
            isActive: activeIndex==0,
            onTap: () {
              onItemTap(0);
            },
          ),
          BottomNavBarTile(
            icon: AssetsPath.hart,
            isActive: activeIndex==1,
            onTap: () {
              onItemTap(1);
            },
          ),
          BottomNavBarTile(
            icon: AssetsPath.menu,
            isActive:  activeIndex==2,
            onTap: () {
              onItemTap(2);
            },
          ),
          BottomNavBarTile(
            icon: AssetsPath.profile,
            isActive:  activeIndex==3,
            onTap: () {
              onItemTap(3);
            },
          ),
        ],
      ),
    ));
  }
}

class BottomNavBarTile extends StatelessWidget {
  const BottomNavBarTile({
    required this.icon,
    required this.isActive,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String icon;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          icon,
          color: isActive ? AppColors.prymeryColor : AppColors.greyColor,
          width: 25,
          height: 25,
        ));
  }
}
