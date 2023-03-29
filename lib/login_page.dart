import 'package:flutter/material.dart';

class LoginPageScreen extends StatefulWidget {
  static const route = "/login-page";
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(),),
    );
  }
}
