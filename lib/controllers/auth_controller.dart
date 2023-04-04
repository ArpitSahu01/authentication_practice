import 'package:authentication_pracitce/screens/home_screen.dart';
import 'package:authentication_pracitce/screens/login_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends GetxController{
  // we did this so that our auth controller is globally accessible from everywhere
  static AuthController instance = Get.find();
  // user is model given by firebase auth which will have user name, email ,password , ...
  late Rx<User?> _user;
  // now we are creating an instance of firebase auth to access all the properties of Firbase authentication
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    // any thing happens to the state of user, it will be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user == null){
      Get.offAll(()=>const LoginPageScreen());
    }else{
      Get.offAll(()=>const HomeScreen());
    }
  }

  void register(String email, String password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar(
          "About User",
          "User Message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text("Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void login(String email,String password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch (e){
      Get.snackbar(
        "About Login",
        "Login Message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text("Login failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  // Google signIn
  signWithGoogle() async{
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for the user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    // finally, lets signIn

    try {
      await auth.signInWithCredential(credential);
    }catch(e){
      Get.snackbar(
        "About Google Authentication",
        "Error in google signIn",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text("Account failed to login with google",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void logOut() async{
      await auth.signOut();
      await GoogleSignIn().signOut();

  }

}