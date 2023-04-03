import 'package:authentication_pracitce/models/user_model.dart';
import 'package:authentication_pracitce/screens/home_screen.dart';
import 'package:authentication_pracitce/screens/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthController extends GetxController{
  // we did this so that our auth controller is globally accessible from everywhere
  static AuthController instance = Get.find();
  // user is model given by firebase auth which will have user name, email ,password , ...
  late Rx<User?> _user;
  // now we are creating an instance of firebase auth to access all the properties of Firbase authentication
  FirebaseAuth auth = FirebaseAuth.instance;
  // now to save the details of the user to firestore we will create an instance of firestore
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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
      Get.offAll(()=> HomeScreen());
    }
  }

  void register({required String email,required String password,required String firstName,required String lastName}) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password).then((value)  {
        postDetailsToFirestore(firstName: firstName,lastName: lastName);
      });
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
  void logOut() async{
      await auth.signOut();
  }


  postDetailsToFirestore({required String firstName,required String lastName}) async{
    // calling our firestore
    // calling our userModel
    // sending these values
    UserModel userModel = UserModel(
      email: _user.value!.email,
      uid: _user.value!.uid,
      firstName: firstName,
      lastName: lastName,
    );
    print("userId: ${userModel.uid}");
    print(userModel.toJson());
    await firebaseFirestore.collection("users").doc(_user.value!.uid.toString()).set(userModel.toJson());
    Get.snackbar("Successful Login", "Login Successfully",titleText: Text("User has been created"));
  }

  getUserInformation() async{
    UserModel? userModel;
    final value = await firebaseFirestore.collection("users").doc(_user.value!.uid).get();
    userModel = UserModel.fromJson(value);
    return userModel.firstName;
  }

}