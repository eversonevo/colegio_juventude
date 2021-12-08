import 'package:colegio_juventude/app/UI/module.dart';
import 'package:colegio_juventude/app/modules/initial_prox/initial_prox_bindings.dart';
import 'package:colegio_juventude/app/modules/initial_prox/initial_prox_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class InitialProxModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/initial_prox',
      page: () => const InitialProxPage(),
      binding: InitialProxBindings(),
    )
  ];
}