import 'package:authentication_pracitce/screens/signup.dart';
import 'package:authentication_pracitce/utils/app_utils.dart';
import 'package:authentication_pracitce/utils/extensions.dart';
import 'package:authentication_pracitce/widget/auth_divider_line.dart';
import 'package:authentication_pracitce/widget/auth_text_field.dart';
import 'package:authentication_pracitce/widget/checked_box.dart';
import 'package:get/get.dart';
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
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
              Text("Login",style: kMontserratSemiBold.copyWith(
                fontSize: 24.0.sp,
              ),),
            SizedBox(height: 5.0.hp,),
            AuthTextField(title: "E-mail",hintText: "Your Email",icon: Icons.mail,hideText: false,),
            SizedBox(height: 2.0.hp,),
            AuthTextField(title: "Password",hintText: "Your Password", icon: Icons.lock, hideText: true),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RememberCheckBox(),
                Text("Forgot Password?",style: kMontserratRegular.copyWith(
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
                child: Text("Login",style: kMontserratRegular.copyWith(
                fontSize: 10.0.sp,
              ),),
              ),
            ),
            SizedBox(height: 6.0.hp,),
            const AuthDividerLine(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.wp,vertical: 3.0.hp,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.0.wp),
                      border: Border.all(color: checkBoxColor.withOpacity(0.2))
                    ),
                    child: Image.asset("assets/login_icon/facebook.png"),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.0.wp),
                        border: Border.all(color: checkBoxColor.withOpacity(0.2))
                    ),
                    child: Image.asset("assets/login_icon/google.png"),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.0.wp),
                        border: Border.all(color: checkBoxColor.withOpacity(0.2))
                    ),
                    child: Image.asset("assets/login_icon/linkden.png"),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Wrap(
                children: [
                  Text("Don't have an account? ",style: kMontserratRegular.copyWith(
                    fontSize: 10.0.sp,
                    color: checkBoxColor,
                  ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=> const SignUpScreen());
                    },
                    child: Text("Signup",style: kMontserratRegular.copyWith(
                      fontSize: 10.0.sp,
                      color: Colors.indigoAccent,
                    ),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.0.hp,)
          ],
        ),
      ),),
    );
  }
}
