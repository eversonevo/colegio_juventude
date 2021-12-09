import 'package:get/get.dart';
import './registration_controller.dart';

class RegistrationBindings implements Bindings {
    @override
    void dependencies() {
        Get.lazyPut(() => RegistrationController());
    }
}