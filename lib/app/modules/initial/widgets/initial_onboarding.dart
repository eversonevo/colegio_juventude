import 'package:colegio_juventude/app/modules/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialOnboarding extends GetView<InitialController> {
   
   InitialOnboarding({required index,Key? key}) : _index = index, super(key: key);

   int _index;
   
   @override
   Widget build(BuildContext context) {
       return Obx(() => Stack(
         alignment: Alignment.center,
         children: [
           Visibility(
             visible: controller.controlPage.value == _index ? true : false,
             child: Container(color: Colors.red,width: 20,height: 20,)),
           Container(color: Colors.white,width: 15,height: 15,),
         ],
       ));
  }
}