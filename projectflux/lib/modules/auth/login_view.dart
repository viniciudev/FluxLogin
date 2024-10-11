// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projectgetx/utils/constants/Theme.dart';
import 'package:projectgetx/widgets/input.dart';
import 'controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final cpfMaskFormatter = MaskTextInputFormatter(
        mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: NowUIColors.black,
          body: LoadingOverlay(
            isLoading: controller.load,
            child: Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/imgs/entregador-andando-de-moto.jpg"),
                            fit: BoxFit.cover))),
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: MediaQuery.of(context).size.height * 0.15),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            // Image.asset("assets/imgs/logo.jpeg", scale: 3.5),
                            SizedBox(height: 20),
                            Container(
                                child: Center(
                                    child: Column(
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text("Flux",
                                            style: GoogleFonts.nunito(
                                                textStyle: TextStyle(
                                                    fontFamily: 'Nunito',
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w900))))),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text("Farma",
                                          style: GoogleFonts.nunito(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w900))),
                                    ))
                              ],
                            ))),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Input(
                                maskTextInputFormatter: cpfMaskFormatter,
                                textInputType: TextInputType.number,
                                placeholder: "Seu o CPF......",
                                onChanged: (value) {
                                  controller.verifyCpf(value);
                                },
                              ),
                            ),
                            controller.inputPassword
                                ? Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Input(
                                      obscureText: true,
                                      placeholder: "Sua senha...",
                                      onChanged: (value) {
                                        controller.verifyCpf(value);
                                      },
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        controller.inputPassword
                            ? Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextButton(
                                    onPressed: () {
                                      // verificar senha
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: NowUIColors.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            32.0), // Adjust the radius as needed
                                      ),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0,
                                            right: 16.0,
                                            top: 16,
                                            bottom: 16),
                                        child: Text("INICIAR",
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: NowUIColors.white))),
                                  ),
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
