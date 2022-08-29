// import 'dart:html';
import 'SignUp.dart';
import 'LogIn.dart';
import 'package:flutter/material.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key : key);

  @override
  State<AuthPage> createState() => _AuthPageState();

  
}
class _AuthPageState extends State<AuthPage>{
    bool showLogIn = true; 

     void toggleScreens(){
      setState(() {
        showLogIn = !showLogIn;
      });
}

@override
  Widget build(BuildContext context) {
      if(showLogIn){
        return LogIn(showSignUp: toggleScreens);
      }
      else{
        return SignUp(showLogIn : toggleScreens);
      }

  }

}
