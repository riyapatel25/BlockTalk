import 'package:flutter/material.dart';
import 'package:block_talk/Pages/LogIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Pages/WelcomePage.dart';
import 'Pages/SignUp.dart';
import 'Pages/MainPage.dart';
import 'firebase_options.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';




// const Taupe = Color(0xFF7D5C65);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BlockTalk());
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(BlockTalk());
// }


class BlockTalk extends StatelessWidget{
  const BlockTalk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlockTalk',
      theme: ThemeData(colorScheme: colours),
      debugShowCheckedModeBanner: false,
      home: LogIn(),
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
