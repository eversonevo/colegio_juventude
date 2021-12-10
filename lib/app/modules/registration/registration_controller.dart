import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {

  final RxInt itemCountTel = 1.obs;
  final RxInt itemCountForm = 1.obs;
  final RxInt itemCountEsp = 1.obs;
  final RxInt itemCountDisc = 1.obs;



  final RxBool _validation = false.obs;
  bool get validation{
    return _validation.value;
  }
  set validation(bool val){
    _validation.value = val;
  }

  TextEditingController nomeController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emailInstController = TextEditingController();
  TextEditingController emailEscController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController formacaoController = TextEditingController();
  TextEditingController especializacaoController = TextEditingController();
  TextEditingController disciplinaController = TextEditingController();

  verifyDatas(){
    if (nomeController.text.length > 0 &&
        rgController.text.length > 0 &&
        cpfController.text.length > 0 &&
        emailInstController.text.length > 0 &&
        emailInstController.text.length > 0 &&
        emailEscController.text.length > 0 &&
        telefoneController.text.length > 0 &&
        formacaoController.text.length > 0 &&
        especializacaoController.text.length > 0 &&
        disciplinaController.text.length > 0){
          print('echogg');
          validation = true;
        }else{
          print('erroroo');
          validation = false;
        }
  }




}