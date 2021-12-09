import 'package:colegio_juventude/app/UI/theme_extensions.dart';
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
               SizedBox(
                 width: Get.width * .9,
                 child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: context.themeGreen),
                      ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: context.themeCyan)),
                        fillColor: Colors.white,
                        filled: true,
                        icon: Icon(Icons.person, color: context.themeGreen),
                        hintText: 'Login'),
                  ),
               ),
               const SizedBox(height: 30,),
               SizedBox(
                 width: Get.width * .9,
                 child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: context.themeGreen)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: context.themeCyan)),
                        fillColor: Colors.white,
                        filled: true,
                        icon: Icon(Icons.password,color: context.themeGreen,),
                        hintText: 'Senha'),
                  ),
               ),
               const SizedBox(height: 5,),
               GestureDetector(onTap: (){
                 Get.toNamed('/register');
               },child: const Align(
                 alignment: Alignment.centerRight,
                 child: Padding(
                   padding: EdgeInsets.only(right: 8),
                   child: Text('Ainda não sou cadastrado!'),
                 ))),
               const SizedBox(height: 30,),
               ElevatedButton(onPressed: (){}, child: Text('com Google'))
             ],
           ),
       );
  }
}