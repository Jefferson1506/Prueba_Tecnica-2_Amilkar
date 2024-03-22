import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/loginPage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Tecnica',
      home: LoginPage(),
    );
  }
}




