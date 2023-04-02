import 'package:authentication_pracitce/screens/home_screen.dart';
import 'package:authentication_pracitce/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController{

  // made this controller globally available and we made it static so that we don't have to make object of it
  static AuthController instance = Get.find();

  // now we created the instance of Firebase auth so that we can use all the properties of firebase authentication
  FirebaseAuth auth = FirebaseAuth.instance;

  // User is model of user containing all the infromation about the user like login, password, email, .....
  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    // here we instanciated the user with the current user it can be null also
    _user = Rx<User?>(auth.currentUser);
    // now we are binding the user with bindStream
    _user.bindStream(auth.userChanges());
    // now using ever function so that any changes _initialScreen will we executed and _user object will be pass on to _initialScreen
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user == null){
      Get.offAll(()=>const LoginPageScreen());
    }else{
      Get.offAll(()=>const HomeScreen());
    }
  }

  register(String email,String password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch (e){
      Get.snackbar(
        "User Authentication",
        "Authentication Failed",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text("Authentication Failed",style: TextStyle(color: Colors.white),),
        messageText: Text(e.toString(),style: TextStyle(color: Colors.white),),
      );
    }
  }

  login(String email,String password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch (e){
      Get.snackbar(
        "User login",
        "Login Failed",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text("Login Failed",style: TextStyle(color: Colors.white),),
        messageText: Text(e.toString(),style: TextStyle(color: Colors.white),),
      );
    }
  }

  logout() async{
    await auth.signOut();
  }
}