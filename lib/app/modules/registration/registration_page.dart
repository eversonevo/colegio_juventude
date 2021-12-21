// ignore_for_file: curly_braces_in_flow_control_structures, void_checks

import 'package:colegio_juventude/app/UI/theme_extensions.dart';
import 'package:colegio_juventude/app/modules/registration/widgtes/checkbox_formation.dart';
import 'package:colegio_juventude/app/modules/registration/widgtes/register_fields.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './registration_controller.dart';

class RegistrationPage extends GetView<RegistrationController> {

    const RegistrationPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                child: Obx(() => AppBar(
                title: const Text('Registro Usuário'),
                backgroundColor: context.themeGreen,
                actions: [
                  if (controller.validation)
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.check_outlined,color: Colors.white,))
                ],),
              )),
            body: ListView(
              children: [
                RegisterFields(label: 'NOME',enabled: true,hintText: 'Nome completo', controllerTextField: controller.listTextEditing[0],index: 0,),
                RegisterFields(label: 'RG', enabled: true,hintText: '00.000.000-0', controllerTextField: controller.listTextEditing[1],index: 1,),
                RegisterFields(label: 'CPF', enabled: true,hintText: '000.000.000-00', controllerTextField: controller.listTextEditing[2],index: 2,),
                    Stack(
                      children: [
                        Obx(() => ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.itemCountTel.value < 3 ? controller.itemCountTel.value : 3,        //número de vezes que você deseja replicar o widget
                                itemBuilder: (context, index){
                                    return Row(
                                      children: [
                                        Obx(() => controller.createDropDownPhone(index)!),
                                        Expanded(child: RegisterFields(label: 'TELEFONES', enabled: true,hintText: 'telefones', controllerTextField: controller.listPhones[index],index: 99,),),
                                        Visibility(
                                          visible: controller.listPhones[index].text.isNotEmpty ? true : false,
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 4),
                                            child: GestureDetector(
                                              onTap: (){
                                                if (controller.itemCountTel.value > 1){
                                                  controller.itemCountTel.value-=1;
                                                   print('leng' + controller.listPhones.length.toString());
                                                   controller.listPhones.removeAt(index);
                                                    print('lengggg' + controller.listPhones.length.toString());
                                                }else{
                                                  controller.listPhones[0].clear();
                                                }
                                              },
                                              child: const Icon(Icons.remove, color: Colors.red,)),
                                          ),
                                        ),
                                      ],
                                    );

                          })),
                          Positioned(
                            right: 8,
                            child: Visibility(
                                      visible: controller.itemCountTel.value == 1 ? true : false,
                                      child: Padding(
                                          padding: const EdgeInsets.only(right: 8),
                                          child: GestureDetector(onTap: (){
                                            controller.listPhones.add(TextEditingController());
                                            controller.itemCountTel.value+=1;
                                            //RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.telefoneController);
                                          }, child: const Icon(Icons.add)),
                                        ),
                                    ),
                          ),
                      ],
                    ),
                RegisterFields(label: 'E-MAIL PESSOAL',enabled: true,hintText: 'meuemail@meuemail.com', controllerTextField: controller.listTextEditing[3],index: 3,),
                RegisterFields(label: 'E-MAIL @ESCOLA', enabled: true,hintText: 'meuemail@escola.pr.gov.br', controllerTextField: controller.listTextEditing[4],index: 4,),
                RegisterFields(label: 'E-MAIL INSTITUCIONAL', enabled: true, hintText: 'meuemail@seed.pr.gov.br', controllerTextField: controller.listTextEditing[5],index: 5,),

// **************  FORMAÇÃO

                    Column(
                      children: [
                        Row(
                          children: [
                            Container(child: const Text('Ensino Fundamental'),),
                            SizedBox(width: 8,),
                            Container(child: const Text('Ensino Regular'),),
                          ],
                        ),
                        CheckboxFormation(index: 0,),
                        Row(
                          children: [
                            Container(child: const Text('Ensino Médio'),),
                            SizedBox(width: 8,),
                            Container(child: const Text('Ensino Regular'),),
                          ],
                        ),
                        CheckboxFormation(index: 1,),

                        Stack(
                          children: [
                            Obx(() => 
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.itemCountForm.value < 3 ? controller.itemCountForm.value : 3,        //número de vezes que você deseja replicar o widget
                                itemBuilder: (context,index){
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                            Container(child: const Text('Graduação'),),
                                            SizedBox(width: 8,),
                                            Expanded(child: RegisterFields(label: 'Curso', enabled: true, hintText: 'Curso', controllerTextField: controller.listFormation[index],index: 99,)),
                                        ],
                                      ),
                                      CheckboxFormation(index: index+2,),
                                    ],
                                  );
                                  
                                }),
                            ),
                            Positioned(
                                right: 8,
                                child: Visibility(
                                          visible: controller.itemCountForm.value == 1 ? true : false,
                                          child: Padding(
                                              padding: const EdgeInsets.only(right: 8),
                                              child: GestureDetector(onTap: (){
                                                if (controller.listFormation.length < 3){
                                                  if (controller.ValidaHinEFEM)
                                                    Get.snackbar('Já Cadastrado', "Já Cadastrado");

                                                    controller.checkedCompleto.add(false);
                                                    controller.checkedIncompleto.add(false);
                                                    
                                                  controller.hintDrop.add('Graduação');
                                                  controller.listFormation.add(TextEditingController());
                                                  //controller.itemFormation.add(item);
                                                }
                                                controller.itemEnsFund.value = true;
                                                controller.itemCountForm.value+=1;
                                                //RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.telefoneController);
                                              }, child: const Icon(Icons.add)),
                                            ),
                                        ),
                              ),
                          ],
                        ),

                      ],
                    ),
                    
/*                                              Expanded(child: TextField(decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.themeGreen)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: context.themeCyan)),
                            fillColor: Colors.white,
                            filled: true,
                            label: Text('Label', style: TextStyle(color: context.themeGreen),),
                            hintText: 'OI'),)),*/

/*
                    Stack(
                          children: [

                                                  //if (!controller.itemEnsFund.value)
                                                    //Container(child: const Text('Ensino Médio'),),
                                                    //Expanded(child: RegisterFields(label: 'FORMAÇÃO', enabled: false, hintText: 'Ensino Regular',controllerTextField: controller.listFormation[index])),
                            Obx(() => ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.itemCountForm.value < 5 ? controller.itemCountForm.value : 5,        //número de vezes que você deseja replicar o widget
                                    itemBuilder: (context, index){
                                        return Column(

                                           children: [

                                            Row(
                                              children: [

                                                Obx(() => controller.createDropDownFormation(index)!),
                                                Expanded(child: RegisterFields(label: 'FORMAÇÃO', enabled: true,hintText: 'Formação', controllerTextField: controller.listFormation[index])),
                                              ],
                                            ),
                                          CheckboxFormation(index: 1,),

                                          ],
                                        );

                              })),
                              Positioned(
                                right: 8,
                                child: Visibility(
                                          visible: controller.itemCountForm.value == 1 ? true : false,
                                          child: Padding(
                                              padding: const EdgeInsets.only(right: 8),
                                              child: GestureDetector(onTap: (){
                                                if (controller.listFormation.length < 5){
                                                  if (controller.ValidaHinEFEM)
                                                    Get.snackbar('Já Cadastrado', "Já Cadastrado");
                                                  controller.hintDrop.add('Graduação');
                                                  controller.listFormation.add(TextEditingController());
                                                  //controller.itemFormation.add(item);
                                                }
                                                controller.itemEnsFund.value = true;
                                                controller.itemCountForm.value+=1;
                                                //RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.telefoneController);
                                              }, child: const Icon(Icons.add)),
                                            ),
                                        ),
                              ),
                          ],
                        ),
*/

// ******** ESPECIALIZAÇÃO
                    Stack(
                      children: [
                        Obx(() => ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.itemCountEsp.value < 5 ? controller.itemCountEsp.value : 5,        //número de vezes que você deseja replicar o widget
                                itemBuilder: (context, index){
                                    return Expanded(child: RegisterFields(label: 'ESPECIALIZAÇÃO', enabled: true,hintText: 'Especialização', controllerTextField: controller.especializacaoController,index: 99,));

                          })),
                          Positioned(
                            right: 8,
                            child: Visibility(
                                      visible: controller.itemCountEsp.value == 1 ? true : false,
                                      child: Padding(
                                          padding: const EdgeInsets.only(right: 8),
                                          child: GestureDetector(onTap: (){
                                            controller.itemCountEsp.value+=1;
                                            //RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.telefoneController);
                                          }, child: const Icon(Icons.add)),
                                        ),
                                    ),
                          ),
                      ],
                    ),
// *********************

                    Stack(
                      children: [
                        Obx(() => ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.itemCountDisc.value < 5 ? controller.itemCountDisc.value : 5,        //número de vezes que você deseja replicar o widget
                                itemBuilder: (context, index){
                                    return Expanded(child: RegisterFields(label: 'DISCIPLINA', enabled: true,hintText: 'Disciplina', controllerTextField: controller.disciplinaController,index: 99,));

                          })),
                          Positioned(
                            right: 8,
                            child: Visibility(
                                      visible: controller.itemCountDisc.value == 1 ? true : false,
                                      child: Padding(
                                          padding: const EdgeInsets.only(right: 8),
                                          child: GestureDetector(onTap: (){
                                            controller.itemCountDisc.value+=1;
                                            //RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.telefoneController);
                                          }, child: const Icon(Icons.add)),
                                        ),
                                    ),
                          ),
                      ],
                    ),

              ],
            ),
        );
    }
}



/*

ListView(
              children: [
 
        RegisterFields(label: 'NOME', hintText: 'Nome completo', controllerTextField: controller.nomeController,),
                RegisterFields(label: 'RG', hintText: '00.000.000-0', controllerTextField: controller.rgController),
                RegisterFields(label: 'CPF', hintText: '000.000.000-00', controllerTextField: controller.cpfController),
                Row(
                  children: [
                    Expanded(child: RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.telefoneController)),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(onTap: (){
                        RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.telefoneController);
                      }, child: const Icon(Icons.add)),
                    ),
                  ],
                ),
                RegisterFields(label: 'E-MAIL PESSOAL', hintText: 'meuemail@meuemail.com', controllerTextField: controller.emailController),
                RegisterFields(label: 'E-MAIL @ESCOLA', hintText: 'meuemail@escola.pr.gov.br', controllerTextField: controller.emailEscController),
                RegisterFields(label: 'E-MAIL INSTITUCIONAL', hintText: 'meuemail@seed.pr.gov.br', controllerTextField: controller.emailInstController),
                Row(
                  children: [
                    Expanded(child: RegisterFields(label: 'FORMAÇÃO', hintText: 'formações', controllerTextField: controller.formacaoController)),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(onTap: (){
                        RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.formacaoController);
                      }, child: const Icon(Icons.add)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: RegisterFields(label: 'ESPECIALIZAÇÃO', hintText: 'especializações', controllerTextField: controller.especializacaoController)),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(onTap: (){
                        RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.especializacaoController);
                      }, child: const Icon(Icons.add)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: RegisterFields(label: 'DISCIPLINA', hintText: 'disciplinas', controllerTextField: controller.disciplinaController)),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(onTap: (){
                        //controller.verifyDatas();
                        RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.disciplinaController);
                      }, child: const Icon(Icons.add)),
                    ),
                  ],
                ),
              ],
            ),

*/
/*
ListView(
              children: [
 
        RegisterFields(label: 'NOME', hintText: 'Nome completo', controllerTextField: controller.nomeController,),
                RegisterFields(label: 'RG', hintText: '00.000.000-0', controllerTextField: controller.rgController),
                RegisterFields(label: 'CPF', hintText: '000.000.000-00', controllerTextField: controller.cpfController),

                Row(
                  children: [
                    Expanded(child: RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.telefoneController)),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(onTap: (){
                        RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.telefoneController);
                      }, child: const Icon(Icons.add)),
                    ),
                  ],
                ),
                

                RegisterFields(label: 'E-MAIL PESSOAL', hintText: 'meuemail@meuemail.com', controllerTextField: controller.emailController),
                RegisterFields(label: 'E-MAIL @ESCOLA', hintText: 'meuemail@escola.pr.gov.br', controllerTextField: controller.emailEscController),
                RegisterFields(label: 'E-MAIL INSTITUCIONAL', hintText: 'meuemail@seed.pr.gov.br', controllerTextField: controller.emailInstController),
                Row(
                  children: [
                    Expanded(child: RegisterFields(label: 'FORMAÇÃO', hintText: 'formações', controllerTextField: controller.formacaoController)),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(onTap: (){
                        RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.formacaoController);
                      }, child: const Icon(Icons.add)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: RegisterFields(label: 'ESPECIALIZAÇÃO', hintText: 'especializações', controllerTextField: controller.especializacaoController)),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(onTap: (){
                        RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.especializacaoController);
                      }, child: const Icon(Icons.add)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: RegisterFields(label: 'DISCIPLINA', hintText: 'disciplinas', controllerTextField: controller.disciplinaController)),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(onTap: (){
                        //controller.verifyDatas();
                        RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.disciplinaController);
                      }, child: const Icon(Icons.add)),
                    ),
                  ],
                ),
              ],
            ),
*/