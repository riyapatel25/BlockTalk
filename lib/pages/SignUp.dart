import 'package:flutter/material.dart';
// import 'SignUp.dart';
import 'LogIn.dart';

// import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
//text controllers
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();

//method for log in
  // Future logIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: _emailController.text.trim(),
  //     password: _passwordController.text.trim(),
  //   );
  // }
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
              // SizedBox(height: 20),
              // Spacer(flex:4),
              Text(
                'HELLO THERE',
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
              //username box textfield
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
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: Color(0xFFE9D6C4),
                    ),
                    prefixIcon: Icon(Icons.person, color: Color(0xFFE9D6C4)),
                    fillColor: Color(0xFF1B191A),
                    filled: true,
                  ),
                ),
              ),
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
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      color: Color(0xFFE9D6C4),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Color(0xFFE9D6C4)),
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
                      'Sign Up',
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
              //not a member yet
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'I am already a member!',
                  style: TextStyle(
                    color: Color(0xFFE9D6C4),
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 2),
                //sign up page redirect

                TextButton(
                  // style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  //       (Set<MaterialState> states) {
                  //         if (states.contains(MaterialState.pressed)) return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                  //         return Color.fromARGB(255, 16, 10, 12); // Use the component's default.
                  //       },
                  //     ),
                  // ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogIn()));
                  },
                  child: const Text(
                    'Log in now',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7D5C65),
                    ),
                  ),
                ),
              ])
            ]))));
  }
}
