import 'package:colegio_juventude/app/UI/module.dart';
import 'package:colegio_juventude/app/modules/initial/initial_bindings.dart';
import 'package:colegio_juventude/app/modules/initial/initial_page.dart';
import 'package:colegio_juventude/app/modules/initial/initial_prox_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class InitialModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/initial',
      page: () => const InitialPage(),
      binding: InitialBindings(),      
    ),
    GetPage(
      name: '/initial_proxp',
      page: () => const InitialProxPage(),
      binding: InitialBindings(),      
    )
  ];
}