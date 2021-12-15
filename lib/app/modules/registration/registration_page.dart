// ignore_for_file: curly_braces_in_flow_control_structures, void_checks

import 'package:colegio_juventude/app/UI/theme_extensions.dart';
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
                RegisterFields(label: 'NOME', hintText: 'Nome completo', controllerTextField: controller.nomeController,),
                RegisterFields(label: 'RG', hintText: '00.000.000-0', controllerTextField: controller.rgController),
                RegisterFields(label: 'CPF', hintText: '000.000.000-00', controllerTextField: controller.cpfController),
                    Stack(
                      children: [
                        Obx(() => ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.itemCountTel.value < 3 ? controller.itemCountTel.value : 3,        //número de vezes que você deseja replicar o widget
                                itemBuilder: (context, index){
                                    return Row(
                                      children: [
                                        Obx(() => controller.createDropDownPhone(index)!),
                                        Expanded(child: RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.telefoneController)),
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
                                            controller.itemCountTel.value+=1;
                                            //RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.telefoneController);
                                          }, child: const Icon(Icons.add)),
                                        ),
                                    ),
                          ),
                      ],
                    ),
                RegisterFields(label: 'E-MAIL PESSOAL', hintText: 'meuemail@meuemail.com', controllerTextField: controller.emailController),
                RegisterFields(label: 'E-MAIL @ESCOLA', hintText: 'meuemail@escola.pr.gov.br', controllerTextField: controller.emailEscController),
                RegisterFields(label: 'E-MAIL INSTITUCIONAL', hintText: 'meuemail@seed.pr.gov.br', controllerTextField: controller.emailInstController),

// **************  FORMAÇÃO

                Stack(
                      children: [
                        Obx(() => ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.itemCountForm.value < 5 ? controller.itemCountForm.value : 5,        //número de vezes que você deseja replicar o widget
                                itemBuilder: (context, index){
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Obx(() => controller.createDropDownFormation(index)!),
                                            Expanded(child: RegisterFields(label: 'FORMAÇÃO', hintText: 'Formação', controllerTextField: controller.listFormation[index])),
                                          ],
                                        ),
                                        Container(
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
                                            value: controller.checkedCompleto.value,
                                            onChanged: controller.checkedIncompleto.value ? null : (bool? v){
                                                  controller.checkedCompleto.value = v!;
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
                                                value: controller.checkedIncompleto.value,
                                                onChanged: controller.checkedCompleto.value ? null : (bool? v){
                                                  controller.checkedIncompleto.value = v!;
                                            }, 

                                              ),
                                            ),
                                          ),),
                                            ],
                                          ),
                                        )
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
                                              controller.listFormation.add(TextEditingController());
                                              //controller.itemFormation.add(item);
                                            }
                                              
                                            controller.itemCountForm.value+=1;
                                            //RegisterFields(label: 'TELEFONES', hintText: 'telefones', controllerTextField: controller.telefoneController);
                                          }, child: const Icon(Icons.add)),
                                        ),
                                    ),
                          ),
                      ],
                    ),

// ******** ESPECIALIZAÇÃO
                    Stack(
                      children: [
                        Obx(() => ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.itemCountEsp.value < 5 ? controller.itemCountEsp.value : 5,        //número de vezes que você deseja replicar o widget
                                itemBuilder: (context, index){
                                    return Expanded(child: RegisterFields(label: 'ESPECIALIZAÇÃO', hintText: 'Especialização', controllerTextField: controller.especializacaoController));

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
                                    return Expanded(child: RegisterFields(label: 'DISCIPLINA', hintText: 'Disciplina', controllerTextField: controller.disciplinaController));

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