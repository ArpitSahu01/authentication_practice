import 'package:authentication_pracitce/screens/login_email_password_screen.dart';
import 'package:authentication_pracitce/screens/login_screen.dart';
import 'package:authentication_pracitce/screens/phone_screen.dart';
import 'package:authentication_pracitce/screens/sign_up_email_password_screen.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: {
        EmailPasswordSignup.routeName: (context) => const EmailPasswordSignup(),
        EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
        PhoneScreen.routeName: (context) => const PhoneScreen(),
      },
    );
  }
}
