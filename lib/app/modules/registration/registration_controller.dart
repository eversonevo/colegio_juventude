import 'package:colegio_juventude/app/models/graduation.dart';
import 'package:colegio_juventude/app/modules/registration/widgtes/register_dropdown_form.dart';
import 'package:colegio_juventude/app/modules/registration/widgtes/register_dropdown_phone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {

  final RxInt itemCountTel = 1.obs;
  final RxInt itemCountForm = 1.obs;
  final RxInt itemCountEsp = 1.obs;
  final RxInt itemCountDisc = 1.obs;

  final RxBool checkedCompleto = false.obs;
  final RxBool checkedIncompleto = false.obs;

  final RxString itemCelular1 = 'Celular'.obs;
  final RxString itemCelular2 = 'Celular'.obs;
  final RxString itemCelular3 = 'Celular'.obs;
  final RxInt index = 1.obs;

  // substituir listForm1,2,3,4,5  Cria um array d arrays
  RxList<List<String>> graphArray = List.generate(5, (index) => ['Ensino Fundamental','Ensino Médio','Graduação']).obs;

  RxList<Graduation> grad = [Graduation(type: 'Ensino Fundamental')].obs;

  //RxList<String> itemFormation = ['Graduação'].obs;
/*

ALGUNS ERROS AINDA

  final RxString itemFormation1 = 'Graduação'.obs;
  final RxString itemFormation2 = 'Graduação'.obs;
  final RxString itemFormation3 = 'Graduação'.obs;
  final RxString itemFormation4 = 'Graduação'.obs;
  final RxString itemFormation5 = 'Graduação'.obs;
*/
  List<String> lista1 = ['Celular','Residencial','Comercial'];
  List<String> lista2 = ['Celular','Residencial','Comercial'];
  List<String> lista3 = ['Celular','Residencial','Comercial'];

/*
  List<String> listForm1 = ['Ensino Fundamental','Ensino Médio','Graduação'];
  List<String> listForm2 = ['Ensino Fundamental','Ensino Médio','Graduação'];
  List<String> listForm3 = ['Ensino Fundamental','Ensino Médio','Graduação'];
  List<String> listForm4 = ['Ensino Fundamental','Ensino Médio','Graduação'];
  List<String> listForm5 = ['Ensino Fundamental','Ensino Médio','Graduação'];
*/

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
  //TextEditingController formacaoController = TextEditingController();
  TextEditingController especializacaoController = TextEditingController();
  TextEditingController disciplinaController = TextEditingController();

  List<TextEditingController> listFormation = [TextEditingController()];

    @override
  void onReady() {
     
    print ('aaa '+listFormation[0].text);
    // corrigir erro que o timer não para

  }

  

  verifyDatas(){
    if (nomeController.text.length > 0 &&
        rgController.text.length > 0 &&
        cpfController.text.length > 0 &&
        emailInstController.text.length > 0 &&
        emailInstController.text.length > 0 &&
        emailEscController.text.length > 0 &&
        telefoneController.text.length > 0 &&
       // formacaoController.text.length > 0 &&
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

   List<String> returnListForm(int index){
    switch(index){
      case 0:
        return graphArray[0];
      case 1:
        return graphArray[1];
      case 2:
        return graphArray[2];
      case 3:
        return graphArray[3];
      case 4:
        return graphArray[4];
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

  Widget? createDropDownPhone(int index){
      if (index == 0) {
        return RegisterDropdownPhone(items: lista1,itemPhone: itemCelular1.value,index: index,);
      }else if (index == 1){
        return RegisterDropdownPhone(items: lista2,itemPhone: itemCelular2.value,index: index,);
      }else{
        return RegisterDropdownPhone(items: lista3,itemPhone: itemCelular3.value,index: index,);
      }
  }  

  Widget? createDropDownFormation(int index){
      print('teste '+graphArray[4][0].toString());
      /*if (index == 0) {
        return RegisterDropdownForm(items: graphArray[0],itemForm: itemFormation[0],index: index,);
        //return RegisterDropdownForm(items: listForm1,itemForm: itemFormation1.value,index: index,);
      }else if (index == 1){
        return RegisterDropdownForm(items: graphArray[1],itemForm: itemFormation[0],index: index,);
      }else if (index == 2){
        return RegisterDropdownForm(items: graphArray[2],itemForm: itemFormation[0],index: index,);
      }else if (index == 3){
        return RegisterDropdownForm(items: graphArray[3],itemForm: itemFormation[0],index: index,);
      }else{
        return RegisterDropdownForm(items: graphArray[4],itemForm: itemFormation[0],index: index,);
      }*/

      return RegisterDropdownForm(items: graphArray[index],itemForm: graphArray[index][0],index: index,);


  }


}