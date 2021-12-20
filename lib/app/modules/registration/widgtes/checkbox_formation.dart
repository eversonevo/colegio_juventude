import 'package:colegio_juventude/app/modules/registration/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckboxFormation extends GetView<RegistrationController> {
   
   CheckboxFormation({required index, Key? key}) : _index = index, super(key: key);

   final int _index;
   
   @override
   Widget build(BuildContext context) {
       return                                             Container(
                                              width: Get.width * .9,
                                              child: Row(
                                                children: [
                                                  Obx(() => Visibility(
                                                    child: Expanded(
                                                      child: CheckboxListTile(
                                                title: const Text('Completo'),
                                                autofocus: false,
                                                activeColor: Colors.green,
                                                checkColor: Colors.white,
                                                value: controller.checkedCompleto[_index],
                                                onChanged: controller.checkedIncompleto[_index] ? null : (bool? v){
                                                      controller.checkedCompleto[_index] = v!;
                                                },

                                              ),
                                                    ),
                                                  ),),
                                              Obx(() => Visibility(
                                                child: Expanded(
                                                  child: CheckboxListTile(
                                                    title: const Text('Incompleto'),
                                                    autofocus: false,
                                                    activeColor: Colors.green,
                                                    checkColor: Colors.white,
                                                    value: controller.checkedIncompleto[_index],
                                                    onChanged: controller.checkedCompleto[_index] ? null : (bool? v){
                                                      controller.checkedIncompleto[_index] = v!;
                                                }, 

                                                  ),
                                                ),
                                              ),),
                                                ],
                                              ),
                                            );
  }
}