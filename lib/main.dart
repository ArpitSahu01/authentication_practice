import 'package:authentication_pracitce/controllers/auth_controller.dart';
import 'package:authentication_pracitce/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:authentication_pracitce/screens/login_page.dart';
import 'package:authentication_pracitce/screens/password_recovery_page.dart';
import 'package:get/get.dart';
import 'package:authentication_pracitce/screens/signup.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Authentication App',
      defaultTransition: Transition.fadeIn,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const LoginPageScreen(),

    );
  }
}
