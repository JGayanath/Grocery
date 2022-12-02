import 'package:flutter/material.dart';
import 'package:grocery/components/custom_button.dart';
import 'package:grocery/components/custom_text.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, spreadRadius: 2),
                    BoxShadow(
                        color: Colors.white, blurRadius: 1, spreadRadius: 1),
                  ],
                ),
                width: 300,
                height: 333,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/smile.png"),
                      const SizedBox(
                        height: 23,
                      ),
                      const Custom_Text("Thanks for Buying\nFrom Us!",fontSize: 20,fontWeight: FontWeight.w500,),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 333),
                  Custom_Button(onTap: ()=>null, text: "See your order"),
                ],
              ),),
          ],
        ),
      ),
    );
  }
}
