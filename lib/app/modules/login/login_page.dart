import 'package:colegio_juventude/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
   
   const LoginPage({Key? key}) : super(key: key);
   
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CircleAvatar(
                 backgroundColor: Colors.green[600],
                 maxRadius: 100.0,
                 child: Image.asset('./assets/logo_juve.png')
               ),
               const SizedBox(height: 30,),
               const SizedBox(
                 width: 450.0,
                 child: TextField(                 
                    autofocus: false,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green)),
                        fillColor: Colors.white,
                        filled: true,
                        icon: Icon(Icons.person, color: Colors.green),
                        hintText: 'Login'),
                  ),
               ),
               const SizedBox(height: 30,),
               const SizedBox(
                 width: 450.0,
                 child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green)),
                        fillColor: Colors.white,
                        filled: true,
                        icon: Icon(Icons.password,color: Colors.green,),
                        hintText: 'Senha'),
                  ),
               ),
               const SizedBox(height: 5,),
               GestureDetector(onTap: (){
                 Get.toNamed('/register');
               },child: const Align(
                 alignment: Alignment.centerRight,
                 child: Text('Ainda não sou cadastrado!'))),
               const SizedBox(height: 30,),
               ElevatedButton(onPressed: (){}, child: Text('com Google'))
             ],
           ),
       );
  }
}