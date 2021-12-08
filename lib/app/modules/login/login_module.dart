import 'package:colegio_juventude/app/UI/module.dart';
import 'package:colegio_juventude/app/modules/login/login_bindings.dart';
import 'package:colegio_juventude/app/modules/login/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class LoginModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBindings(),
    )
  ];
}