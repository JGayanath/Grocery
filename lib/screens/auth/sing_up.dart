import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery/components/custom_button.dart';
import 'package:grocery/components/customtextfield.dart';
import 'package:grocery/controllers/auth_controller.dart';
import 'package:grocery/models/model_providers/singup_provider.dart';
import 'package:grocery/screens/auth/sing_in.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:provider/provider.dart';
import '../../components/custom_text.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {

  final  auth_controler = Auth_Controler();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 96.0,),
                  Custom_Text("Sing Up",fontSize: 25.0,),
                  const SizedBox(height: 40.0,),
                  Image.asset(
                    AssetsPath.imagePath,
                    width: 202,
                    height: 138,
                  ),
                  const SizedBox(height: 20.0,),
                  CustomTextfiled(controller: Provider.of<Singup_Provider>(context).nameController, hintText: "Name"),
                  const SizedBox(height: 8.0,),
                  CustomTextfiled(controller: Provider.of<Singup_Provider>(context).emailController, hintText: "Email"),
                  const SizedBox(height: 8.0,),
                  CustomTextfiled(controller: Provider.of<Singup_Provider>(context).passwordController, hintText: "Password",isobscure: true),
                  const SizedBox(height: 16.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          UtilFuntions.navigateTo(context, Login());
                        },
                          child: Custom_Text("Already have an account?",fontSize: 14.0,color: Colors.black,)),
                    ],
                  ),
                  const SizedBox(height: 24.0,),

                  Consumer<Singup_Provider>(builder: (context , value ,child) {
                    return Custom_Button(
                        isLoader: value.isLoading,
                      onTap: (){
                      value.stratSingUp(context);
                    }, text: 'Sing Up', );
                  }
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
