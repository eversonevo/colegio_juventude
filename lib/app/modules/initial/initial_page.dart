import 'package:colegio_juventude/app/modules/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPage extends GetView<InitialController> {

  const InitialPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {

     final ButtonStyle style = ElevatedButton.styleFrom(primary: controller.colorButton,);
       return Scaffold(
           body: Column(
             children: [
               Container(
                 child: Center(
                   child: Image.asset(controller.imageAsset),
                 ),
               ),
               ElevatedButton(
                 style: style,
                 onPressed: (){
                   Get.toNamed('/initial_prox');
                 }, child: Text("Seguir"))
             ],
           ),
       );
  }
}