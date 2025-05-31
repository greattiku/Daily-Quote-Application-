import 'package:daily_qoutes_app/Controller/qoutes_controller.dart';
import 'package:daily_qoutes_app/bindings/app_bindings.dart';
import 'package:daily_qoutes_app/Screens/home.dart';
import 'package:daily_qoutes_app/Screens/quote_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
   MyBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home(),
    );
  }
}

