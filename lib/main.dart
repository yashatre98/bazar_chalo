import 'package:flutter/material.dart';
import 'landing.dart';
import 'customer_login.dart';
import 'owner_login.dart';

void main()
{
  runApp(BazarChalo());
}

class BazarChalo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Landing(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color.fromARGB(255, 20, 18, 40),
      ),
    );
  }
}
