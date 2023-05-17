import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery/components/custom_button.dart';
import 'package:grocery/components/customtextfield.dart';
import 'package:grocery/controllers/auth_controller.dart';
import 'package:grocery/models/model_providers/admin_provider.dart';
import 'package:grocery/models/model_providers/singup_provider.dart';
import 'package:grocery/screens/auth/sing_in.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:provider/provider.dart';
import '../../components/custom_text.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {

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
                  Custom_Text("Admin - Save Product Info ",fontSize: 25.0,),
                  const SizedBox(height: 40.0,),
                  Consumer<Admin_Provider>(builder: (context,value,child){
                    return value.image.path==""? IconButton(onPressed: (){
                      value.selectImage();
                    }, icon: Icon(Icons.image,size: 65,)): InkWell(
                      onTap: ()=> value.selectImage(),
                        child:Image.file(value.image,width: 200,height: 200,fit: BoxFit.fill,));
                  }),

                  // Image.asset(
                  //   AssetsPath.imagePath,
                  //   width: 202,
                  //   height: 138,
                  // ),
                  const SizedBox(height: 20.0,),
                  CustomTextfiled(controller: Provider.of<Admin_Provider>(context).productNameController, hintText: "Product Name"),
                  const SizedBox(height: 8.0,),
                  CustomTextfiled(controller: Provider.of<Admin_Provider>(context).descriptionProductController, hintText: "Description"),
                  const SizedBox(height: 8.0,),
                  CustomTextfiled(controller: Provider.of<Admin_Provider>(context).priceController, hintText: "Price",isobscure: false),


                  const SizedBox(height: 24.0,),

                  Consumer<Admin_Provider>(builder: (context , value ,child) {
                    return Custom_Button(
                        isLoader: value.isLoading,
                      onTap: (){
                      value.startSaveProductData();
                    }, text: 'Save Product', );
                  }
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
