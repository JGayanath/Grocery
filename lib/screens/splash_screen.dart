import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery/controlers/auth_controler.dart';
import 'package:grocery/utils/assets_constant.dart';
import '../components/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final Auth_Controler auth_controler = Auth_Controler();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      auth_controler.initializeUser(context);
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
              child: Custom_Text("Shop Your Daily \nNecessary"),
            ),
          ],
        ),
      ),
    );
  }
}
