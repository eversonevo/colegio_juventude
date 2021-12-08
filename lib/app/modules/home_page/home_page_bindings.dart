import 'package:colegio_juventude/app/modules/home_page/home_page_controller.dart';
import 'package:get/get.dart';

class HomePageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    
  }
}
