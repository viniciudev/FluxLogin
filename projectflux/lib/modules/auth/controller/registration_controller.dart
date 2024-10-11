import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projectgetx/modules/auth/models/states.dart';
import 'package:projectgetx/modules/auth/utils/api_endpoints.dart';
import 'package:projectgetx/views/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressNumberController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController codIBGEController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pispasepController = TextEditingController();
  TextEditingController cnhNumberController = TextEditingController();
  TextEditingController cnhDateController = TextEditingController();
  TextEditingController cnhCategoryController = TextEditingController();
  TextEditingController plateController = TextEditingController();
  TextEditingController naturalnessController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController rgSSPController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController nameFatherController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController civilStatusController = TextEditingController();
  TextEditingController dependentsController = TextEditingController();
  TextEditingController renavamNumberController = TextEditingController();
  TextEditingController chassisNumberController = TextEditingController();
  TextEditingController pixKeyController = TextEditingController();
  TextEditingController cepController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final cepMaskFormatter = MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  final phoneMaskFormatter = MaskTextInputFormatter(
      mask: '(##)# ####-####', filter: {"#": RegExp(r'[0-9]')});
  // Future<Map<String, dynamic>>
  fetchCep(String value) async {
    print(value);
    String cep = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (cep.length == 8) {
      _load(true);
      final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> resp = json.decode(response.body);
        addressController.text = resp['logradouro'];
        complementController.text = resp['complemento'];
        bairroController.text = resp['bairro'];
        cidades = estadosCidades[resp['estado']]!;
        estadoSelecionado = resp['estado'];
        cidadeSelecionada = resp['localidade'];
        codIBGEController.text = resp['ibge'];
        cepController.text = cep;
        _load(false);
      } else {
        throw Exception('Falha ao buscar o CEP');
      }
    }
  }

  String? estadoSelecionado;
  String? cidadeSelecionada;
  List<String> cidades = [];

  selectState(String? novoEstado) {
    estadoSelecionado = novoEstado;
    cidades = estadosCidades[novoEstado]!;
    cidadeSelecionada = null;
    update();
  }

  citySelected(String? novaCidade) {
    cidadeSelecionada = novaCidade;
    update();
  }

  bool load = false;
  _load(bool value) {
    load = value;
    update();
  }

  List<String> optionsCarType = [
    'Motocicleta',
    'Caminhão',
    'Automóvel',
    'Bicicleta'
  ];
  String? car;

  carSelected(String? newcar) {
    car = newcar!;
    update();
  }

  // Function to validate the PIS/PASEP number using checksum
  bool isPisPasepValid(String pisPasep) {
    List<int> weights = [
      3,
      2,
      9,
      8,
      7,
      6,
      5,
      4,
      3,
      2
    ]; // Weights for the checksum calculation
    int sum = 0;

    for (int i = 0; i < 10; i++) {
      sum += int.parse(pisPasep[i]) *
          weights[i]; // Multiply each digit by its respective weight
    }

    int mod11 = sum % 11;
    int checkDigit = (mod11 < 2) ? 0 : 11 - mod11; // Calculate the check digit

    return checkDigit ==
        int.parse(pisPasep[
            10]); // Compare with the last digit of the PIS/PASEP number
  }

  selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate =
          DateFormat('dd/MM/yyyy').format(picked); // Format date as dd/MM/yyyy

      cnhDateController.text =
          formattedDate; // Set the formatted date in the input
      update();
    }
  }

  selectBirthDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate =
          DateFormat('dd/MM/yyyy').format(picked); // Format date as dd/MM/yyyy

      birthDateController.text =
          formattedDate; // Set the formatted date in the input
      update();
    }
  }

  List<String> optionsColorRace = [
    'Branco',
    'Preto',
    'Pardo',
    'Amarelo',
    'Indígina'
  ];
  String? colorRace;

  colorRaceSelected(String? colorRaceValue) {
    colorRace = colorRaceValue;
    update();
  }

  List<String> optionsPixType = [
    'CPF/CNPJ',
    'Fone',
    'E-mail',
    'Chave Aleatória'
  ];
  String? pixType;
  pixTypeSelected(String? pixTypeValue) {
    pixType = pixTypeValue;
    update();
  }

  save() {
    Map<String, dynamic> map = {
      'nome': nameController.text,
      'endereco': addressController.text,
      'numero': addressNumberController.text,
      'complemento': complementController.text,
      'bairro': bairroController.text,
      'estado': estadoSelecionado,
      'cidade': cidadeSelecionada,
      'codIBGE': codIBGEController.text,
      'cep': cepController.text,
      'celular': phoneController.text,
      'tipoVeiculo': car,
      'pis/pasep': pispasepController.text,
      'cnh': cnhNumberController.text,
      'vencimentocnh': cnhDateController.text,
      'categoriacnh': cnhCategoryController.text,
      'placa': plateController.text,
      'rg': rgController.text,
      'ssp': rgSSPController.text,
      'datanascimento': birthDateController.text,
      'nomepai': nameFatherController.text,
      'nomemae': motherNameController.text,
      'cidadenascimento': naturalnessController.text,
      'estadocivil': civilStatusController.text,
      'numerodependentes': dependentsController.text,
      'email': emailController.text,
      'corraca': colorRace,
      'numerochassis': chassisNumberController.text,
      'tipopix': pixType,
      'chavepix': pixKeyController.text,
      'senha': passwordController.text,
    };

    print(map);
  }
}
