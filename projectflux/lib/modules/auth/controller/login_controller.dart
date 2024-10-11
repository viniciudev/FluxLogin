import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:projectgetx/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool load = false;
  bool inputPassword = false;
  verifyCpf(e) async {
    String result = e.replaceAll(RegExp(r'[^0-9]'), '');
    if (result.length == 11) {
      //buscar por cpf e habilitar o input senha
      _load(true);
      await Future.delayed(const Duration(seconds: 3));

      //se achar cpf habilita input senha
      if (result == '99999999999') {
        inputPassword = true;
      } else {
        //se não achar o cpf direciona pra registro
        Get.toNamed(AppRoutes.registration);
      }
      _load(false);
    }
  }

  _load(bool value) {
    load = value;
    update();
  }
}
