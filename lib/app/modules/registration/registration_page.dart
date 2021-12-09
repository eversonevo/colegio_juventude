import 'package:colegio_juventude/app/UI/theme_extensions.dart';
import 'package:colegio_juventude/app/modules/registration/widgtes/register_fields.dart';
import 'package:colegio_juventude/app/modules/registration/widgtes/register_telephones.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './registration_controller.dart';

class RegistrationPage extends GetView<RegistrationController> {
    
    const RegistrationPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Registro Usuário'),
              backgroundColor: context.themeGreen,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.add,color: Colors.white,))
              ],),
            body: Column(
              children: [
                RegisterFields(label: 'NOME', hintText: 'Nome completo'),
                RegisterFields(label: 'RG', hintText: '00.000.000-0'),
                RegisterFields(label: 'CPF', hintText: '000.000.000-00'),
                Row(
                  children: [
                    Expanded(child: RegisterFields(label: 'TELEFONES', hintText: 'telefones')),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(onTap: (){
                        const RegisterTelephones();
                      }, child: const Icon(Icons.add)),
                    ),
                  ],
                ),
                RegisterFields(label: 'E-MAIL PESSOAL', hintText: 'meuemail@meuemail.com'),
                RegisterFields(label: 'E-MAIL @ESCOLA', hintText: 'meuemail@escola.pr.gov.br'),
                RegisterFields(label: 'E-MAIL INSTITUCIONAL', hintText: 'meuemail@seed.pr.gov.br'),
                RegisterFields(label: 'FORMAÇÃO', hintText: 'Ensino Fundamental/Ensino Médio/Graduação'),
                RegisterFields(label: 'ESPECIALIZAÇÃO', hintText: 'Pós-Graduação/Mestrado/Doutorado'),
                RegisterFields(label: 'DISCIPLINA', hintText: 'Disciplinas que atua'),
              ],
            ),
        );
    }
}