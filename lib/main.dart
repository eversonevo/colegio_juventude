
import 'package:colegio_juventude/app/modules/initial/initial_bindings.dart';
import 'package:colegio_juventude/app/modules/initial/initial_module.dart';
import 'package:colegio_juventude/app/modules/initial/initial_page.dart';
import 'package:colegio_juventude/app/modules/login/login_module.dart';
import 'package:colegio_juventude/app/modules/registration/registration_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/home_page/home_page_module.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      getPages: [
        ...InitialModule().routers,
        ...LoginModule().routers,
        ...HomePageModule().routers,
        ...RegistrationModule().routers,
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InitialPage(),
    );
  }
}