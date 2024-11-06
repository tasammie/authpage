import 'package:auth_page/SCREEN/home.dart';
import 'package:auth_page/SCREEN/login_page.dart';
import 'package:auth_page/SCREEN/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/home': (context) => const HomePage(),
        '/login_page': (context) => const LoginPage(),
        '/register_page': (context) => const RegisterPage(),
        // '/forgot_password': (context) => ForgotPasswordPage(),
        // '/reset_password': (context) => ResetPasswordPage(),
      },
    );
  }
}

      // home: HomePage(),