import 'package:authentication_pracitce/screens/login_page.dart';
import 'package:authentication_pracitce/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../utils/app_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool _obsureText = true;
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                SizedBox(height: 6.0.hp,),
                Text("Sign up",style: kMontserratSemiBold.copyWith(
                  fontSize: 24.0.sp,
                ),),
                SizedBox(height: 5.0.hp,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("First Name",style: kMontserratMedium.copyWith(
                        fontSize: 12.0.sp
                    ),),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        hintText: "Your First Name",
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.length<=2){
                          return "Please enter valid name";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(height: 2.0.hp,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Last Name",style: kMontserratMedium.copyWith(
                        fontSize: 12.0.sp
                    ),),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        hintText: "Your Last Name",
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.length<=2){
                          return "Please enter valid name";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(height: 2.0.hp,),
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
                SizedBox(height: 2.0.hp,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Password",style: kMontserratMedium.copyWith(
                        fontSize: 12.0.sp
                    ),),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _passwordController,
                      obscureText:  _obsureText,
                      validator: (value){
                        if(value == null || value.length<=6){
                          return "Password should be longer or equal to 6 characters.";
                        }
                      },
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
                  child: ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      String name = "${_firstNameController.text.trim()} ${_lastNameController.text.trim()}";
                      String email = _emailController.text.trim();
                      String password = _passwordController.text.trim();
                      print(name);
                      print(email);
                      print(password);
                    }
                  },
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
                          Get.offAll(()=> const LoginPageScreen());
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
        ),
      ),),
    );
  }
}
