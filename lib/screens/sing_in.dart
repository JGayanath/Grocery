import 'package:flutter/material.dart';
import 'package:grocery/components/customtextfield.dart';
import 'package:grocery/utils/app_colors.dart';
import 'package:grocery/utils/assets_constant.dart';

import '../components/custom_text.dart';

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
                // redirect forgot password screen
              },
              child: Custom_Text(
                "Forgot your Password?",fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500,),
            ),
          ),
          const SizedBox(
            height: 29,
          ),
          Container(
            width: 259,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.prymeryColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Align(
              alignment: Alignment.center,
                child: Custom_Text("Login",color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w500,)),
          ),
        ],
      ),
    ));
  }
}
