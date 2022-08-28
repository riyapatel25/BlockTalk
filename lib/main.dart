import 'package:flutter/material.dart';
import 'package:block_talk/Pages/LogIn.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'Pages/Welcome.dart';
import 'Pages/SignUp.dart';



// const Taupe = Color(0xFF7D5C65);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(BlockTalk());
}


class BlockTalk extends StatelessWidget{
  const BlockTalk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlockTalk',
      theme: ThemeData(colorScheme: colours),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

const colours = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF7D5C65),
  onPrimary: Color(0xFFE9D6C4),
  secondary: Color(0xFF1B191A),
  onSecondary: Color(0xFFF5F2F3),
  tertiary: Color(0xFF808767),
  error: Color(0xFFA61F1F),
  onError: Color(0xFFFCFAFA),
  background: Color(0xFF7D5C65),
  onBackground: Color(0xFFE9D6C4),
  surface: Color(0xFF1B191A),
  onSurface: Color(0xFFF5F2F3),
);
