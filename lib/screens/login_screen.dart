import 'package:authentication_pracitce/screens/sign_up_email_password_screen.dart';
import 'package:flutter/material.dart';
import '../widget/custom_buttons.dart';
import 'login_email_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordSignup.routeName);
              },
              text: 'Email/Password Sign Up',
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordLogin.routeName);
              },
              text: 'Email/Password Login',
            ),
            CustomButton(
                onTap: () {
                },
                text: 'Phone Sign In'),
            CustomButton(
              onTap: () {
              },
              text: 'Google Sign In',
            ),
            CustomButton(
              onTap: () {
              },
              text: 'Facebook Sign In',
            ),
            CustomButton(
              onTap: () {
              },
              text: 'Anonymous Sign In',
            ),
          ],
        ),
      ),
    );
  }
}