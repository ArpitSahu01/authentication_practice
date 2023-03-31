import 'package:authentication_pracitce/screens/login_page.dart';
import 'package:authentication_pracitce/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../utils/app_utils.dart';
import '../widget/auth_divider_line.dart';
import '../widget/auth_text_field.dart';
import '../widget/checked_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.0.hp,),
              Text("Sign up",style: kMontserratSemiBold.copyWith(
                fontSize: 24.0.sp,
              ),),
              SizedBox(height: 5.0.hp,),
              AuthTextField(title: "First Name",hintText: "Your First Name",hideText: false,),
              SizedBox(height: 2.0.hp,),
              AuthTextField(title: "Last Name",hintText: "Your Last Name",hideText: false,),
              SizedBox(height: 2.0.hp,),
              AuthTextField(title: "E-mail",hintText: "Your Email",icon: Icons.mail,hideText: false,),
              SizedBox(height: 2.0.hp,),
              AuthTextField(title: "Password",hintText: "Your Password", icon: Icons.lock, hideText: true),
              SizedBox(height: 2.0.hp,),
              Wrap(
                children: [
                  Text("By signing up you agree to our",style: kMontserratRegular.copyWith(
                    fontSize: 10.0.sp,
                    color: checkBoxColor,
                  ),
                  ),
                  Text(" Terms & Condition ",style: kMontserratRegular.copyWith(
                    fontSize: 10.0.sp,
                    color: Colors.indigoAccent,
                  ),),
                  Text("and ",style: kMontserratRegular.copyWith(
                    fontSize: 10.0.sp,
                    color: checkBoxColor,
                  ),
                  ),
                  Text("Privacy Policy.*",style: kMontserratRegular.copyWith(
                    fontSize: 10.0.sp,
                    color: Colors.indigoAccent,
                  ),),
                ],
              ),
              SizedBox(height: 6.0.hp,),
              SizedBox(
                width: 100.0.wp,
                height: 5.0.hp,
                child: ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(checkBoxColor),
                  ),
                  child: Text("SignUp",style: kMontserratRegular.copyWith(
                    fontSize: 10.0.sp,
                  ),),
                ),
              ),
              SizedBox(height: 10.0.hp,),
              Center(
                child: Wrap(
                  children: [
                    Text("Already signed up ? ",style: kMontserratRegular.copyWith(
                      fontSize: 10.0.sp,
                      color: checkBoxColor,
                    ),
                    ),
                    GestureDetector(
                      onTap: (){
                        print("Hello world");
                        Get.to(()=> const LoginPageScreen());
                      },
                      child: Text("Login",style: kMontserratRegular.copyWith(
                        fontSize: 10.0.sp,
                        color: Colors.indigoAccent,
                      ),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.0.hp,),
            ],
          ),
        ),
      ),),
    );
  }
}
