import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectgetx/routes/app_routes.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
            primaryColor: Colors.pink,
            appBarTheme: const AppBarTheme(
                foregroundColor: Colors.pink //here you can give the text color
                )),
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: AppRoutes.login,
        getPages: AppPages.pages,
        title: "Getx",
    );
  }
}
