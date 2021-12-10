import 'package:colegio_juventude/app/modules/registration/widgtes/register_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {

  final RxInt itemCountTel = 1.obs;
  final RxInt itemCountForm = 1.obs;
  final RxInt itemCountEsp = 1.obs;
  final RxInt itemCountDisc = 1.obs;

  final RxString itemCelular1 = 'Celular'.obs;
  final RxString itemCelular2 = 'Celular'.obs;
  final RxString itemCelular3 = 'Celular'.obs;
  final RxInt index = 1.obs;

  List<String> lista1 = ['Celular','Residencial','Comercial'];
  List<String> lista2 = ['Celular','Residencial','Comercial'];
  List<String> lista3 = ['Celular','Residencial','Comercial'];



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

  List<String> returnListPhone(int index){
    switch(index){
      case 0:
        return lista1;
      case 1:
        return lista2;
      case 2:
        return lista3;
    }
    return [];
  }

  String returnItemCelular(int index){
    switch(index){
      case 0:
        return itemCelular1.value;
      case 1:
        return itemCelular2.value;
      case 2:
        return itemCelular3.value;
    }
    return "";   
  }

  Text returnHintPhone(int index){
    switch(index){
      case 0:
        return Text(itemCelular1.value);
      case 1:
        return Text(itemCelular2.value);
      case 2:
        return Text(itemCelular3.value);
    }
    return const Text("");
  }

  Widget? createDropDown(int index){
      if (index == 0) {
        return RegisterDropdown(items: lista1,hint: 'Celular',itemPhone: itemCelular1.value,index: index,);
      }else if (index == 1){
        return RegisterDropdown(items: lista2,hint: 'Celular',itemPhone: itemCelular2.value,index: index,);
      }else{
        return RegisterDropdown(items: lista3,hint: 'Celular',itemPhone: itemCelular3.value,index: index,);
      }
  }  

}