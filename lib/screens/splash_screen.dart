import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/screens/sing_up.dart';
import 'package:grocery/utils/app_colors.dart';
import 'package:grocery/utils/assets_constant.dart';

import '../components/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SingUp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInUp(child: Image.asset(AssetsPath.imagePath)),
            const SizedBox(
              height: 50,
            ),
            FadeInDown(
                child: Custom_Text(text: "Shop Your Daily \nNecessary" ,color: AppColors.prymeryColor,),
            ),
          ],
        ),
      ),
    );
  }
}


