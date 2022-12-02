
import 'package:flutter/material.dart';
import 'package:grocery/components/custom_button.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/utils/app_colors.dart';

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Custom_Text("Profile",fontSize: 25,color: AppColors.prymeryColor,),
                  SizedBox(
                    height: 122,
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffBCC5E3),width:2),
                      color: Color(0xffF7FAFF),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Icon(Icons.person,size: 60,),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Custom_Text("Name",fontSize: 18,color:Colors.black,fontWeight: FontWeight.w400,),
                  SizedBox(
                    height: 8,
                  ),
                  Custom_Text("janakagayanath@gmail.com",fontSize: 13,color:Colors.black,fontWeight: FontWeight.w400,),
                  SizedBox(
                    height: 235,
                  ),
                  Custom_Button(onTap:()=>null, text: "Log out"),
                  SizedBox(
                    height: 76,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
