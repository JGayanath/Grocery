

import 'package:flutter/material.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/model_providers/home/oder_provider.dart';
import 'package:grocery/screens/main/oders/widgets/oder_item.dart';
import 'package:provider/provider.dart';

class Oders extends StatefulWidget {
  const Oders({Key? key}) : super(key: key);

  @override
  State<Oders> createState() => _OdersState();
}

class _OdersState extends State<Oders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
              children: [
                Custom_Text("Oders",fontSize: 30,),
                Expanded(
                  child: Consumer<OderProvider>(builder: (context,value, child){
                    return value.oders.isEmpty? Center(child: Custom_Text("No oders")):ListView.separated(itemBuilder: (context , index) {
                      return Oder_Item(oder_model: value.oders[index]);
                    } , separatorBuilder: (context , index){
                      return SizedBox(height: 10,);
                    }, itemCount: value.oders.length);
                  }),
                ),
              ],
            )),
      ),
    );
  }
}
