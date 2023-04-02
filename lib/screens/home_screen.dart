import 'package:authentication_pracitce/controllers/auth_controller.dart';
import 'package:authentication_pracitce/utils/app_utils.dart';
import 'package:authentication_pracitce/utils/extensions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomeScreen"),centerTitle: true,),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HomeScreen",style: kMontserratRegular.copyWith(
                fontSize: 24.0.sp,
              ),),
              ElevatedButton(onPressed: (){
                AuthController.instance.logout();
              }, child: const Text("Logout")),
            ],
          ),
        ),
      ),
    );
  }
}

