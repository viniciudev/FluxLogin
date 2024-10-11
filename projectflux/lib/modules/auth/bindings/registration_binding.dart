import 'package:get/get.dart';
import 'package:projectgetx/modules/auth/controller/registration_controller.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(() {
      return RegistrationController();
    });
  }
}