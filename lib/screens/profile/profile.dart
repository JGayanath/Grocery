
import 'package:flutter/material.dart';
import 'package:grocery/components/custom_button.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/model_providers/singin_provider.dart';
import 'package:grocery/models/model_providers/user_provider.dart';
import 'package:grocery/screens/admin/admin.dart';
import 'package:grocery/utils/app_colors.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:provider/provider.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({Key? key}) : super(key: key);

  @override
  State<Profile_page> createState() => _Profile_pageState();
}
class _Profile_pageState extends State<Profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 49),
          child: SingleChildScrollView(
            child: Center(
              child: Consumer<User_Provider>(builder: (context,value,child){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Custom_Text("Profile",fontSize: 25,color: AppColors.prymeryColor,),
                    SizedBox(
                      height: 122,
                    ),
                    InkWell(
                      onTap: ()=> value.selectAndUploadProfileImage(),
                      child: value.isLoading ? CircularProgressIndicator.adaptive(
                        backgroundColor: AppColors.whiteColor,
                      ): Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffBCC5E3),width:2),
                          color: Color(0xffF7FAFF),
                          borderRadius: BorderRadius.circular(45),
                          image: DecorationImage(
                            image: NetworkImage("${value.userModel?.image}"),
                            fit: BoxFit.fill
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                Custom_Text("${value.userModel?.name.toString()}",fontSize: 18,color:Colors.black,fontWeight: FontWeight.w400,),
                    SizedBox(
                      height: 8,
                    ),
                    Consumer<User_Provider>(builder: (context, value ,child) {
                      return
                        Custom_Text("${value.userModel?.email}",fontSize: 13,color:Colors.black,fontWeight: FontWeight.w400,);
                    } ),
                    SizedBox(
                      height: 235,
                    ),
                    Consumer<Singin_Provider>(builder:(context,value,child){
                      return Custom_Button(onTap:(){
                        value.signOut();
                      }, text: "Log out");
                }),
                    SizedBox(
                      height: 76,
                    ),
                Custom_Button(onTap:(){
                  UtilFuntions.navigateTo(context, Admin());
                }, text: "Go to Admin"),

                    SizedBox(
                      height: 26,
                    ),

                  ],
                );
              }),
              ),
            ),
          ),
        ),
    );
  }
}
