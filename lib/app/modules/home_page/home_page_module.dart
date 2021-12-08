import 'package:colegio_juventude/app/UI/module.dart';
import 'package:colegio_juventude/app/modules/home_page/home_page.dart';
import 'package:colegio_juventude/app/modules/home_page/home_page_bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomePageModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomePageBindings(),
    )
  ];
}