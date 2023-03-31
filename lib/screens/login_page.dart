import 'package:authentication_pracitce/screens/signup.dart';
import 'package:authentication_pracitce/utils/app_utils.dart';
import 'package:authentication_pracitce/utils/extensions.dart';
import 'package:authentication_pracitce/widget/auth_divider_line.dart';
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
  bool _obsureText = true;
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
              SizedBox(height: 10.0.hp,),
                Text("Login",style: kMontserratSemiBold.copyWith(
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
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      hintText: "Your Email",
                      border:  OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.0.hp,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Password",style: kMontserratMedium.copyWith(
                      fontSize: 12.0.sp
                  ),),
                  SizedBox(height: 10,),
                  TextFormField(
                    obscureText:  _obsureText,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Your Password",
                      border: const OutlineInputBorder(),
                      suffixIcon: _obsureText ? IconButton(onPressed: (){
                        setState(() {
                          _obsureText = false;
                        });
                      }, icon: const Icon(Icons.visibility_off_outlined)):IconButton(onPressed: (){
                        setState(() {
                          _obsureText = true;
                        });
                      }, icon: const Icon(Icons.visibility_outlined)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RememberCheckBox(),
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
              SizedBox(height: 2.0.hp,),
            ],
          ),
        ),
      ),),
    );
  }
}
