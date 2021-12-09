import 'package:colegio_juventude/app/UI/module.dart';
import 'package:colegio_juventude/app/modules/registration/registration_bindings.dart';
import 'package:colegio_juventude/app/modules/registration/registration_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RegistrationModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/register',
      page: () => const RegistrationPage(),
      binding: RegistrationBindings(),
    )
  ];
}