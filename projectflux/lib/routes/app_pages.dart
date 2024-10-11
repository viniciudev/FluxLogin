import 'package:get/get.dart';
import 'package:projectgetx/modules/auth/bindings/registration_binding.dart';
import 'package:projectgetx/modules/auth/registration_view.dart';
import 'package:projectgetx/routes/app_routes.dart';
import '../modules/auth/bindings/login_binding.dart';
import '../modules/auth/login_view.dart';


class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.registration,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
  ];
}
