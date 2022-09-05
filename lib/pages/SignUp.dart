import 'package:flutter/material.dart';
// import 'SignUp.dart';
import 'LogIn.dart';
import 'PostPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:block_talk/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  
  // string for displaying the error Message
  String? errorMessage;


  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
      style: TextStyle( color: Color(0xFFE9D6C4)),
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
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
                  hintText: 'First Name',
                  hintStyle: TextStyle(
                    color: Color(0xFFE9D6C4),
                  ),
                  prefixIcon: Icon(Icons.account_circle, color: Color(0xFFE9D6C4)),
                  fillColor: Color(0xFF1B191A),
                  filled: true,
                ),
        );

    //second name field
    final secondNameField = TextFormField(
      style: TextStyle( color: Color(0xFFE9D6C4)),
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
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
                  hintText: 'Last Name',
                  hintStyle: TextStyle(
                    color: Color(0xFFE9D6C4),
                  ),
                  prefixIcon: Icon(Icons.account_circle, color: Color(0xFFE9D6C4)),
                  fillColor: Color(0xFF1B191A),
                  filled: true,
                ),
        );

    //email field
    final emailField = TextFormField(
      style: TextStyle( color: Color(0xFFE9D6C4)),
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
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
      style: TextStyle( color: Color(0xFFE9D6C4)),

        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
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
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Color(0xFFE9D6C4),
                  ),
                  prefixIcon: Icon(Icons.vpn_key, color: Color(0xFFE9D6C4)),
                  fillColor: Color(0xFF1B191A),
                  filled: true,
                ),
       );

    //confirm password field
    final confirmPasswordField = TextFormField(
      style: TextStyle( color: Color(0xFFE9D6C4)),

        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
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
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(
                    color: Color(0xFFE9D6C4),
                  ),
                  prefixIcon: Icon(Icons.vpn_key, color: Color(0xFFE9D6C4)),
                  fillColor: Color(0xFF1B191A),
                  filled: true,
                ),
        );

    //signup button
    final signUpButton = Material(
      elevation: 5,
      color: Color(0xFF808767),
      borderRadius: BorderRadius.circular(24),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            "SignUp",
            textAlign: TextAlign.center,
             style: TextStyle(
                        color: Color(0xFFE9D6C4),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
          )
          ),
   );

    return Scaffold(
      backgroundColor: Color(0xFF1B191A),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.red),
      //     onPressed: () {
      //       // passing this to our root
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ),
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
                    'HELLO THERE',
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xFFE9D6C4),
                    ),
                  ),
                    // SizedBox(
                    //     height: 180,
                    //     // child: Image.asset(
                    //     //   "assets/logo.png",
                    //     //   fit: BoxFit.contain,
                    //     // )
                    //     ),
                    SizedBox(height: 25),
                    firstNameField,
                    SizedBox(height: 20),
                    secondNameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      Text(
                        'I am already a member!',
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
                                      builder: (context) => LogIn()));
                            },
                            child: 
                            
                            const Text(
                              'Log in now',
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

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser; 

    UserModel userModel = UserModel(); 

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => PostPage()),
        (route) => false);
  }
}


  //------------- function for sign up -------------
  // void signUp(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       await _auth
  //           .createUserWithEmailAndPassword(email: email, password: password)
  //           .then((value) => {postDetailsToFirestore()})
  //           .catchError((e) {
  //         Fluttertoast.showToast(msg: e!.message);
  //       });
  //     } on FirebaseAuthException catch (error) {
  //       switch (error.code) {
  //         case "invalid-email":
  //           errorMessage = "Your email address appears to be malformed.";
  //           break;
  //         case "wrong-password":
  //           errorMessage = "Your password is wrong.";
  //           break;
  //         case "user-not-found":
  //           errorMessage = "User with this email doesn't exist.";
  //           break;
  //         case "user-disabled":
  //           errorMessage = "User with this email has been disabled.";
  //           break;
  //         case "too-many-requests":
  //           errorMessage = "Too many requests";
  //           break;
  //         case "operation-not-allowed":
  //           errorMessage = "Signing in with Email and Password is not enabled.";
  //           break;
  //         default:
  //           errorMessage = "An undefined Error happened.";
  //       }
  //       Fluttertoast.showToast(msg: errorMessage!);
  //       print(error.code);
  //     }
  //   }
  // }

//   postDetailsToFirestore() async {
//     // calling our firestore
//     // calling our user model
//     // sedning these values

//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;

//     UserModel userModel = UserModel();

//     // writing all the values
//     userModel.email = user!.email;
//     userModel.uid = user.uid;
//     userModel.firstName = firstNameEditingController.text;
//     userModel.secondName = secondNameEditingController.text;

//     await firebaseFirestore
//         .collection("users")
//         .doc(user.uid)
//         .set(userModel.toMap());
//     Fluttertoast.showToast(msg: "Account created successfully :) ");

//     Navigator.pushAndRemoveUntil(
//         (context),
//         MaterialPageRoute(builder: (context) => PostPage()),
//         (route) => false);
//   }
// }

// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
// //text controllers
//   // final _emailController = TextEditingController();
//   // final _passwordController = TextEditingController();

// //method for log in
//   // Future logIn() async {
//   //   await FirebaseAuth.instance.signInWithEmailAndPassword(
//   //     email: _emailController.text.trim(),
//   //     password: _passwordController.text.trim(),
//   //   );
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFF1B191A),
//         body: SafeArea(
//             child: Center(
//                 //add single child view
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//               // SizedBox(height: 20),
//               // Spacer(flex:4),
//               Text(
//                 'HELLO THERE',
//                 style: TextStyle(
//                   fontSize: 36,
//                   color: Color(0xFFE9D6C4),
//                 ),
//               ),
//               SizedBox(height: 25),

//               //email box textfield
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 25.0),
//                 child: TextField(
//                   // controller: _emailController,
//                   style: TextStyle( color: Color(0xFFE9D6C4)),
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF808767)),
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                           color: Color.fromARGB(255, 133, 54, 123), width: 5),
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                     hintText: 'Email',
//                     hintStyle: TextStyle(
//                       color: Color(0xFFE9D6C4),
//                     ),
//                     prefixIcon: Icon(Icons.mail, color: Color(0xFFE9D6C4)),
//                     fillColor: Color(0xFF1B191A),
//                     filled: true,
//                   ),
//                 ),
//               ),
//               //space
//               SizedBox(height: 10),
//               //username box textfield
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 25.0),
//                 child: TextField(
//                   // controller: _emailController,
//                   style: TextStyle( color: Color(0xFFE9D6C4)),
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF808767)),
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                           color: Color.fromARGB(255, 133, 54, 123), width: 5),
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                     hintText: 'Username',
//                     hintStyle: TextStyle(
//                       color: Color(0xFFE9D6C4),
//                     ),
//                     prefixIcon: Icon(Icons.person, color: Color(0xFFE9D6C4)),
//                     fillColor: Color(0xFF1B191A),
//                     filled: true,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               //password textfield
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 25.0),
//                 child: TextField(
//                   // controller: _passwordController,
//                   style: TextStyle( color: Color(0xFFE9D6C4)),
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF808767)),
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                           color: Color.fromARGB(255, 133, 54, 123), width: 5),
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                     hintText: 'Password',
//                     hintStyle: TextStyle(
//                       color: Color(0xFFE9D6C4),
//                     ),
//                     prefixIcon: Icon(Icons.security, color: Color(0xFFE9D6C4)),
//                     fillColor: Color(0xFF1B191A),
//                     filled: true,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 25.0),
//                 child: TextField(
//                   // controller: _passwordController,
//                   style: TextStyle( color: Color(0xFFE9D6C4)),
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF808767)),
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                           color: Color.fromARGB(255, 133, 54, 123), width: 5),
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                     hintText: 'Confirm Password',
//                     hintStyle: TextStyle(
                      // color: Color(0xFFE9D6C4),
//                     ),
//                     prefixIcon: Icon(Icons.lock, color: Color(0xFFE9D6C4)),
//                     fillColor: Color(0xFF1B191A),
//                     filled: true,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),

//               //log in button
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 25.0),
//                 // child: GestureDetector(
//                 // onTap:logIn, //method when log in button is clocked
//                 child: Container(
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Color(0xFF808767),
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         color: Color(0xFFE9D6C4),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // ),
//               ),
//               SizedBox(height: 10),
//               //not a member yet
//               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 Text(
//                   'I am already a member!',
//                   style: TextStyle(
//                     color: Color(0xFFE9D6C4),
//                     // fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//                 SizedBox(width: 2),
//                 //sign up page redirect

//                 TextButton(
//                   // style: ButtonStyle(
//                   //     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                   //       (Set<MaterialState> states) {
//                   //         if (states.contains(MaterialState.pressed)) return Theme.of(context).colorScheme.primary.withOpacity(0.5);
//                   //         return Color.fromARGB(255, 16, 10, 12); // Use the component's default.
//                   //       },
//                   //     ),
//                   // ),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => LogIn()));
//                   },
//                   child: const Text(
//                     'Log in now',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF7D5C65),
//                     ),
//                   ),
//                 ),
//               ])
//             ]))));
//   }
// }
