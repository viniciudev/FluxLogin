import 'package:get/get.dart';
import 'package:projectgetx/modules/auth/controller/login_controller.dart';
import 'package:projectgetx/modules/auth/controller/registration_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController();
    });
    //    Get.lazyPut<RegisterationController>(() => RegisterationController());
  }
}
