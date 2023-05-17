import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery/controllers/auth_controller.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:provider/provider.dart';
import '../components/custom_text.dart';
import '../models/model_providers/user_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final Auth_Controler auth_controler = Auth_Controler();

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(milliseconds: 3500),
          () {
        Provider.of<User_Provider>(context, listen: false)
            .initializeUser(context);
      },
    );
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
