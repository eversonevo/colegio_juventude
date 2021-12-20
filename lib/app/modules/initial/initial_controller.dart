



import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InitialController extends GetxController { 
Color colorButton = Colors.green[600]!;
final imageAsset = './assets/logo_juve.png';

RxInt controlPage = 1.obs;

  @override
  void onReady() {
     
    startTimer();
    // corrigir erro que o timer não para

  }

  @override
  void onClose() {
     
    controlPage.value = 1;
    super.onClose();
  }

void startTimer() {
  const oneSec = Duration(seconds: 1);
  var timer = Timer.periodic(oneSec,(Timer timer) {
      controlPage.value+=1;
      if (controlPage.value == 4) {
        timer.cancel;
      print('iruuu');
      Get.toNamed('/login');
    }else{
      print('noooo');
    }
    });
  }
}