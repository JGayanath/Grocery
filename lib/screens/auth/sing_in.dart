import 'package:flutter/material.dart';
import 'package:grocery/components/custom_button.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/components/customtextfield.dart';
import 'package:grocery/screens/auth/forgot_password.dart';
import 'package:grocery/screens/home/home_screen.dart';
import 'package:grocery/utils/app_colors.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:grocery/utils/util_funtions.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 96.0,
            ),
            const Custom_Text(
              "Login",
              fontSize: 25.0,
            ),
            const SizedBox(
              height: 41,
            ),
            Image.asset(
              AssetsPath.imagePath,
              width: 202,
              height: 138,
            ),
            const SizedBox(
              height: 45,
            ),
            CustomTextfiled(controller: _email, hintText: "Email"),
            const SizedBox(
              height: 8,
            ),
            CustomTextfiled(controller: _password, hintText: "Password",isobscure: true,),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: (){
                  UtilFuntions.navigateTo(context, Forgot_password()); //navigate to forget password
                },
                child: Custom_Text(
                  "Forgot your Password?",fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500,),
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Custom_Button(onTap: () {
              UtilFuntions.navigateTo(context, Home_Screen()); // navigate to home screen
              },text: "Login"),
            const SizedBox(
              height: 23,
            ),
            Custom_Text("Or login with social account",color: Colors.black,fontSize: 14,),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    AssetsPath.imageiconfb,
                    width: 23.5,
                    height: 24,
                  ),
                ),
                const SizedBox(width:50),
                Container(
                  child: Image.asset(
                    AssetsPath.imageicongole,
                    width: 23.5,
                    height: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}


