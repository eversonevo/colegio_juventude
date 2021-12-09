import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './registration_controller.dart';

class RegistrationPage extends GetView<RegistrationController> {
    
    const RegistrationPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Registro Usuário'),),
            body: Container(),
        );
    }
}