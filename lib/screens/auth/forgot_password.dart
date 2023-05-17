import 'package:flutter/material.dart';
import 'package:grocery/components/custom_button.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/components/customtextfield.dart';
import 'package:grocery/models/model_providers/singin_provider.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:provider/provider.dart';

class Forgot_password extends StatefulWidget {
  const Forgot_password({Key? key}) : super(key: key);

  @override
  State<Forgot_password> createState() => _Forgot_passwordState();
}

class _Forgot_passwordState extends State<Forgot_password> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 96,
              ),
              Custom_Text("Forgot Password",fontSize:25,),
              const SizedBox(
                height: 42,
              ),
              Container(
                child: Image.asset(
                  AssetsPath.imagePath,
                  width: 202,
                  height: 138,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.centerLeft,
                  child: const Custom_Text("Please, enter your email address. You will receive\n a link to create a new password via email.",fontSize: 14,color: Colors.black)),
              const SizedBox(
                height: 16,
              ),
              CustomTextfiled(controller: Provider.of<Singin_Provider>(context).resetpassworemailController, hintText: "Email2"),
              const SizedBox(
                height: 4,
              ),
              Custom_Text("Not a valid email address. Should be your@email.com",fontSize: 11,color: Colors.red),
              const SizedBox(
                height: 53,
              ),
              Consumer<Singin_Provider>(builder: (context , value ,child) {
                return Custom_Button(
                  isLoader: value.isLoading,
                  onTap: (){
                    value.stratsendPasswordResetEmail(context);
                  }, text: 'Send', );
              }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
