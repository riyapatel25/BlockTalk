import 'package:block_talk/Pages/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'LogIn.dart';
import 'WelcomePage.dart';
import 'PostPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:block_talk/Pages/widgets/Post.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(), //checking if logged in ornot
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return PostPage();
            }
            else{
              return LogIn(); //welcome page doesnt log in
            }
          },
        ),

        );
  }
}
