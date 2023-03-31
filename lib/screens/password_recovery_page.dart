import 'package:authentication_pracitce/screens/login_page.dart';
import 'package:authentication_pracitce/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../utils/app_utils.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.0.hp,),
                IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.arrow_back)),
                SizedBox(height: 2.0.hp,),
                Text("Password Recovery",style: kMontserratSemiBold.copyWith(
                  fontSize: 24.0.sp,
                ),),
                SizedBox(height: 5.0.hp,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("E-mail",style: kMontserratMedium.copyWith(
                        fontSize: 12.0.sp
                    ),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        hintText: "Your Email",
                        border:  OutlineInputBorder(),
                      ),
                      validator: (value){
                        final bool _isEmailValid =
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                        if(!_isEmailValid){
                          return "Invalid Email";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(height: 6.0.hp,),
                SizedBox(
                  width: 100.0.wp,
                  height: 5.0.hp,
                  child: ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      String email = _emailController.text.trim();
                      print(email);
                    }
                  },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(checkBoxColor),
                    ),
                    child: Text("Reset",style: kMontserratRegular.copyWith(
                      fontSize: 10.0.sp,
                    ),),
                  ),
                ),
                ],
            ),
          ),
        ),
      ),),
    );
  }
}
