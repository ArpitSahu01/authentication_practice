import 'package:authentication_pracitce/controllers/auth_controller.dart';
import 'package:authentication_pracitce/utils/app_utils.dart';
import 'package:authentication_pracitce/utils/extensions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userName;
  @override
  void initState() {
    // Future.delayed(Duration(seconds: 0),(){
    //   userName = AuthController.instance.getUserInformation().toString();
    // });
    userName = AuthController.instance.getUserInformation().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomeScreen"),centerTitle: true,),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
              child: Text("Hello ${userName}",style: kMontserratRegular.copyWith(
                fontSize: 24.0.sp,
              ),),
              ),
              ElevatedButton(onPressed:  (){
                AuthController.instance.logOut();
              }, child: const Text("Logout",style: TextStyle(fontSize: 24),)),
            ],
          ),
        ),
      ),
    );
  }
}

