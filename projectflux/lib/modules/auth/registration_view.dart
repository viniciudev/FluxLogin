import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:projectgetx/modules/auth/controller/registration_controller.dart';
import 'package:projectgetx/modules/auth/models/states.dart';
import 'package:projectgetx/utils/constants/Theme.dart';
import 'package:projectgetx/utils/methods/snackbar.dart';
import 'package:projectgetx/utils/methods/stringIsNullOrEmpty.dart';
import 'package:projectgetx/widgets/decoration-dropdownbff.dart';
import 'package:projectgetx/widgets/input.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = window.physicalSize.height;
    final formKey = GlobalKey<FormState>();
    bool checkboxValue = false;
    return GetBuilder<RegistrationController>(
      builder: (_) {
        return Scaffold(
          body: LoadingOverlay(
            isLoading: _.load,
            child: SafeArea(
              child: Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16, left: 16.0, right: 16.0, bottom: 16.0),
                    child: Container(
                        color: NowUIColors.bgColorScreen,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: ListView(
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, bottom: 0),
                                  child: Center(
                                      child: Text("Registro Inicial",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600))),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 0, bottom: 8.0),
                                  child: Center(
                                    child: Text(
                                        "cadastro para acessar o flux farma",
                                        style: TextStyle(
                                            color: NowUIColors.time,
                                            fontWeight: FontWeight.w200,
                                            fontSize: 16)),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        placeholder: "Nome completo...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.cepController,
                                        placeholder: "CEP...",
                                        maskTextInputFormatter:
                                            _.cepMaskFormatter,
                                        textInputType: const TextInputType
                                            .numberWithOptions(),
                                        onChanged: (v) {
                                          _.fetchCep(v);
                                        },
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.addressController,
                                        placeholder: "Endereço...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      
                                      child: Input(
                                        controller:_. addressNumberController,
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                        textInputType: TextInputType.number,
                                        placeholder: "Número...",
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       left: 8.0, top: 0, bottom: 16),
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     children: [
                                    //       Checkbox(
                                    //           activeColor: NowUIColors.primary,
                                    //           onChanged: (bool? newValue) => {},
                                    //           // setState(() =>
                                    //           //     checkboxValue =
                                    //           //         newValue!),
                                    //           value: checkboxValue),
                                    //       const Text(
                                    //           "I agree with the terms and conditions",
                                    //           style: TextStyle(
                                    //               color: NowUIColors.black,
                                    //               fontSize: 12,
                                    //               fontWeight: FontWeight.w200)),
                                    //     ],
                                    //   ),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        placeholder: "Complemento...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.bairroController,
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                        placeholder: "Bairro...",
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: DropdownButtonFormField<String>(
                                          validator: (p0) {
                                            if (isNullOrEmpty(p0)) {
                                              return "Campo obrigatório!";
                                            }
                                            return null;
                                          },
                                          decoration: customInputDecoration(
                                              placeholder:
                                                  'Selecione o estado'),
                                          value: controller.estadoSelecionado,
                                          onChanged: (String? novoEstado) {
                                            controller.selectState(novoEstado);
                                          },
                                          items: estadosCidades.keys
                                              .map((String estado) {
                                            return DropdownMenuItem<String>(
                                              value: estado,
                                              child: Text(
                                                estado,
                                                style: const TextStyle(
                                                    height: 0.55,
                                                    fontSize: 13.0,
                                                    color: NowUIColors.time),
                                              ),
                                            );
                                          }).toList(),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: DropdownButtonFormField<String>(
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                        decoration: customInputDecoration(
                                            placeholder: 'Selecione a cidade'),
                                        value: controller.cidadeSelecionada,
                                        onChanged: (String? novaCidade) {
                                          controller.citySelected(novaCidade);
                                        },
                                        items: controller.cidades
                                            .map((String cidade) {
                                          return DropdownMenuItem<String>(
                                            value: cidade,
                                            child: Text(
                                              cidade,
                                              style: const TextStyle(
                                                  height: 0.55,
                                                  fontSize: 13.0,
                                                  color: NowUIColors.time),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Campo obrigatório!';
                                          } else if (value
                                                  .replaceAll(
                                                      RegExp(r'[^0-9]'), '')
                                                  .length !=
                                              11) {
                                            return 'Entre com um número válido!';
                                          }
                                          return null;
                                        },
                                        placeholder: "Celular...",
                                        maskTextInputFormatter:
                                            _.phoneMaskFormatter,
                                        controller: _.phoneController,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: DropdownButtonFormField<String>(
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                        decoration: customInputDecoration(
                                            placeholder: 'Tipo do veículo'),
                                        value: controller.car,
                                        onChanged: (String? newcar) {
                                          controller.carSelected(newcar);
                                        },
                                        items: controller.optionsCarType
                                            .map((String car) {
                                          return DropdownMenuItem<String>(
                                            value: car,
                                            child: Text(
                                              car,
                                              style: const TextStyle(
                                                  height: 0.55,
                                                  fontSize: 13.0,
                                                  color: NowUIColors.time),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.pispasepController,
                                        placeholder: "Número PIS/PASEP...",
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Campo obrigatório!';
                                          } else if (value.length != 11) {
                                            return 'PIS/PASEP o número deve ter 11 dígitos!';
                                          } else if (!_
                                              .isPisPasepValid(value)) {
                                            return 'Número PIS/PASEP inválido!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.cnhNumberController,
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          } else if (p0!.length != 11) {
                                            return "Quantidade de dígitos inválidos!";
                                          }
                                          return null;
                                        },
                                        placeholder:
                                            "Registro da Habilitação...",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.cnhDateController,
                                        onTap: () => _.selectDate(context),
                                        placeholder:
                                            "Vencimento da Habilitação...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Input(
                                          controller: _.cnhCategoryController,
                                          placeholder: "Categoria da CNH...",
                                          validator: (p0) {
                                            if (isNullOrEmpty(p0)) {
                                              return "Campo obrigatório!";
                                            }
                                            return null;
                                          },
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.plateController,
                                        placeholder: "Placa do Veículo...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.rgController,
                                        placeholder:
                                            "RG (carteira de identidade)...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.rgSSPController,
                                        placeholder: "Órgão Emissor do RG...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.birthDateController,
                                        onTap: () => _.selectBirthDate(context),
                                        placeholder: "Data de Nascimento...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.nameFatherController,
                                        placeholder: "Nome do Pai...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.motherNameController,
                                        placeholder: "Nome da Mãe...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.naturalnessController,
                                        placeholder:
                                            "Cidade de Nascimento (Naturalidade)...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.nationalityController,
                                        placeholder:
                                            "Nacionalidade de nascimento...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.civilStatusController,
                                        placeholder: "Estado Cível...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        textInputType: TextInputType.number,
                                        controller: _.dependentsController,
                                        placeholder: "Número de dependentes...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        textInputType: TextInputType.number,
                                        controller: _.emailController,
                                        placeholder: "E-Mail...",
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Campo obrigatório!';
                                          }
                                          // Regular expression for basic email validation
                                          String pattern =
                                              r'^[^@]+@[^@]+\.[^@]+';
                                          RegExp regex = RegExp(pattern);

                                          if (!regex.hasMatch(value)) {
                                            return 'Entre com um email válido!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: DropdownButtonFormField<String>(
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                        decoration: customInputDecoration(
                                            placeholder:
                                                'Cor/Raça (você se considera)...'),
                                        value: controller.colorRace,
                                        onChanged: (String? colorRace) {
                                          controller
                                              .colorRaceSelected(colorRace);
                                        },
                                        items: controller.optionsColorRace
                                            .map((String colorRace) {
                                          return DropdownMenuItem<String>(
                                            value: colorRace,
                                            child: Text(
                                              colorRace,
                                              style: const TextStyle(
                                                  height: 0.55,
                                                  fontSize: 13.0,
                                                  color: NowUIColors.time),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.chassisNumberController,
                                        placeholder:
                                            "Número do Chassis do Veículo...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.renavamNumberController,
                                        placeholder:
                                            "Número do RENAVAM do Veículo...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: DropdownButtonFormField<String>(
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                        decoration: customInputDecoration(
                                            placeholder:
                                                'Tipo de chave PIX...'),
                                        value: controller.pixType,
                                        onChanged: (String? pixType) {
                                          controller.pixTypeSelected(pixType);
                                        },
                                        items: controller.optionsPixType
                                            .map((String pixType) {
                                          return DropdownMenuItem<String>(
                                            value: pixType,
                                            child: Text(
                                              pixType,
                                              style: const TextStyle(
                                                  height: 0.55,
                                                  fontSize: 13.0,
                                                  color: NowUIColors.time),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.pixKeyController,
                                        placeholder: "Chave PIX...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Input(
                                        controller: _.passwordController,
                                        placeholder:
                                            "Senha para acessar o aplicativo...",
                                        validator: (p0) {
                                          if (isNullOrEmpty(p0)) {
                                            return "Campo obrigatório!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: TextButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        controller.save();
                                      } else {
                                        showWarningSnackbar();
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: NowUIColors.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            32.0), // Adjust the radius as needed
                                      ),
                                    ),
                                    child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 32.0,
                                            right: 32.0,
                                            top: 12,
                                            bottom: 12),
                                        child: Text("Registrar",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: NowUIColors.white))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))),
              ),
            ),
          ),
        );
      },
    );
  }
}
