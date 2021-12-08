import 'package:colegio_juventude/app/modules/initial/initial_controller.dart';
import 'package:colegio_juventude/app/modules/initial_prox/initial_prox_controller.dart';
import 'package:get/get.dart';

class InitialProxBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialProxController());
    
  }
}
