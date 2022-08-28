import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1B191A),
        body: SafeArea(
            child: Center(
                //add single child view
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              SizedBox(height: 20),
              Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 36,
                  color: Color(0xFFE9D6C4),
                ),
              ),
              SizedBox(height: 25),
              //email box textfield
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  // controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF808767)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 133, 54, 123), width: 5),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Color(0xFFE9D6C4),
                    ),
                    prefixIcon: Icon(Icons.mail, color: Color(0xFFE9D6C4)),
                    fillColor: Color(0xFF1B191A),
                    filled: true,
                  ),
                ),
              ),
              //space
              SizedBox(height: 10),
              //password textfield
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  // controller: _passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF808767)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 133, 54, 123), width: 5),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Color(0xFFE9D6C4),
                    ),
                    prefixIcon: Icon(Icons.security, color: Color(0xFFE9D6C4)),
                    fillColor: Color(0xFF1B191A),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 10),
              //log in button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                // child: GestureDetector(
                // onTap:logIn, //method when log in button is clocked
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF808767),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Color(0xFFE9D6C4),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                // ),
              ),
              SizedBox(height: 10),
            ]))));
  }
}
