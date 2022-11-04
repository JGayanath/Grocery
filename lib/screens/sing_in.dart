import 'package:flutter/material.dart';
import 'package:grocery/components/customtextfield.dart';
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
          SizedBox(
            height: 96.0,
          ),
          Custom_Text(
            "Login",
            fontSize: 25.0,
          ),
          SizedBox(
            height: 41,
          ),
          Image.asset(
            AssetsPath.imagePath,
            width: 202,
            height: 138,
          ),
          SizedBox(
            height: 45,
          ),
          CustomTextfiled(controller: _email, hintText: "Email"),
          SizedBox(
            height: 8,
          ),
          CustomTextfiled(controller: _password, hintText: "Password",isobscure: true,),
        ],
      ),
    ));
  }
}
