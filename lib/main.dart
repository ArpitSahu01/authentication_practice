import 'package:authentication_pracitce/screens/login_screen.dart';
import 'package:flutter/material.dart';


void main(){
  
  
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

      },
    );
  }
}
