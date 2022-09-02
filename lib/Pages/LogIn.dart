import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'PostPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //--------------------define the fields----------------------------
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
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
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
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
        prefixIcon: Icon(Icons.vpn_key, color: Color(0xFFE9D6C4)),
        fillColor: Color(0xFF1B191A),
        filled: true,
      ),
    );

    final loginButton = Material(
      color: Color(0xFF808767),
      borderRadius: BorderRadius.circular(24),
      elevation: 5,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFE9D6C4),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )),
    );
    //--------------------define the fields----------------------------
    return Scaffold(
      backgroundColor: Color(0xFF1B191A),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFF1B191A),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HELLO AGAIN',
                      style: TextStyle(
                        fontSize: 36,
                        color: Color(0xFFE9D6C4),
                      ),
                    ),
                    SizedBox(height: 25),
                    // SizedBox(
                    //     height: 200,
                    //     child: Image.asset(
                    //       "assets/logo.png",
                    //       fit: BoxFit.contain,
                    //     )),
                    // SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                        'Not a member?',
                        style: TextStyle(
                          color: Color(0xFFE9D6C4),
                          // fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        ),
                        SizedBox(width: 2),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: 
                            
                            const Text(
                              'Register now',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7D5C65),
                              ),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  //------------- function for log in -------------
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            //sign in user with Firebase
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => PostPage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }


//old code
// class LogIn extends StatefulWidget {
//   @override
//   _LogInState createState() => _LogInState();
// }

// class _LogInState extends State<LogIn> {
// //text controllers
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

// // method for log in button
//   Future logIn() async {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: _emailController.text.trim(),
//       password: _passwordController.text.trim(),
//     );
//   }
//   //help memory management
//   @override
//   void dispose(){
//     _emailController.dispose();
//     _passwordController.dispose();

//     super.dispose();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFF1B191A),
//         body: SafeArea(
//             child: Center(
//                 child: SingleChildScrollView(
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//             // SizedBox(height: 20),
//             // Spacer(flex:4),
//             Text(
//               'HELLO AGAIN',
//               style: TextStyle(
//                 fontSize: 36,
//                 color: Color(0xFFE9D6C4),
//               ),
//             ),
//             SizedBox(height: 25),

//             //email box textfield
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 25.0),
//               child: TextField(
//                 style: TextStyle( color: Color(0xFFE9D6C4)),
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0xFF808767)),
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                         color: Color.fromARGB(255, 133, 54, 123), width: 5),
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   hintText: 'Email',
//                   hintStyle: TextStyle(
//                     color: Color(0xFFE9D6C4),
//                   ),
//                   prefixIcon: Icon(Icons.mail, color: Color(0xFFE9D6C4)),
//                   fillColor: Color(0xFF1B191A),
//                   filled: true,
//                 ),
//               ),
//             ),
//             //space
//             SizedBox(height: 10),
//             //password textfield
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 25.0),
//               child: TextField(
//                 style: TextStyle( color: Color(0xFFE9D6C4)),
//                 obscureText: true,
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0xFF808767)),
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                         color: Color.fromARGB(255, 133, 54, 123), width: 5),
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   hintText: 'Password',
//                   hintStyle: TextStyle(
//                     color: Color(0xFFE9D6C4),
//                   ),
//                   prefixIcon: Icon(Icons.security, color: Color(0xFFE9D6C4)),
//                   fillColor: Color(0xFF1B191A),
//                   filled: true,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             //log in button
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 25.0),
//               // child: GestureDetector(
//               // onTap:logIn, //method when log in button is clocked
//               child: GestureDetector(
//                 onTap: logIn,
//                 child: Container(
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Color(0xFF808767),
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       'Log In',
//                       style: TextStyle(
//                         color: Color(0xFFE9D6C4),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               // ),
//             ),
//             SizedBox(height: 10),
//             //not a member yet
//             Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Text(
//                 'Not a member?',
//                 style: TextStyle(
//                   color: Color(0xFFE9D6C4),
//                   // fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//               SizedBox(width: 2),
//               //sign up page redirect

//               TextButton(
//                 // style: ButtonStyle(
//                 //     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                 //       (Set<MaterialState> states) {
//                 //         if (states.contains(MaterialState.pressed)) return Theme.of(context).colorScheme.primary.withOpacity(0.5);
//                 //         return Color.fromARGB(255, 16, 10, 12); // Use the component's default.
//                 //       },
//                 //     ),
//                 // ),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => SignUp()));
//                 },
//                 chi2ld: const Text(
//                   'Register now',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF7D5C65),
//                   ),
//                 ),
//               ),
//             ])
//           ]),
//         ))));
//   }
// }
}