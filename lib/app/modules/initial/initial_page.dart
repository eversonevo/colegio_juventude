import 'package:colegio_juventude/app/modules/initial/initial_controller.dart';
import 'package:colegio_juventude/app/modules/initial/widgets/initial_onboarding.dart';
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
               Center(
                 child: Container(
                   width: Get.width *.4,
                   height: 50,
                   color: Colors.blue,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       InitialOnboarding(index: 1),
                       SizedBox(width: 10,),
                       InitialOnboarding(index: 2),
                       SizedBox(width: 10,),
                       InitialOnboarding(index: 3),
                     ],
                   ),
                 ),
               ),
               /*ElevatedButton(
                 style: style,
                 onPressed: (){
                   Get.toNamed('/initial_proxp');
                 }, child: Text("Seguir"))*/
             ],
           ),
       );
  }
}