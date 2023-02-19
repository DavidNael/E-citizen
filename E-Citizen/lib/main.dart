import 'package:ecitizen/modules/login/LoginScreen.dart';
import 'package:ecitizen/shared/styles/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ECitizen());
}

class ECitizen extends StatelessWidget {
  const ECitizen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: lightTheme(),
    );
  }
}
