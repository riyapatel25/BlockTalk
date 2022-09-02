import 'package:flutter/material.dart';
import 'package:block_talk/Pages/widgets/Post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:block_talk/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'LogIn.dart';


class PostPage extends StatefulWidget {
    const PostPage({Key? key}) : super(key: key);
    @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
   User? user = FirebaseAuth.instance.currentUser;
  //curent user
  UserModel loggedInUser = UserModel();


  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
        appBar: AppBar(
          backgroundColor: Color(0xFF7D5C65),
          shadowColor: Color(0xFF808767),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //button 1
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5);
                      return Color.fromARGB(
                          255, 129, 111, 116); // Use the component's default.
                    },
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'My City',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFE9D6C4),
                  ),
                ),
              ),
              //space
              SizedBox(width: 10),
              //button 2
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5);
                      return Color.fromARGB(
                          255, 129, 111, 116); // Use the component's default.
                    },
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Friends',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFE9D6C4),
                  ),
                ),
              ),
              // Icon(Icons.restaurant_menu),

              //    Text(
              //     'My City',
              //     style: TextStyle(
              //     fontSize: 20,
              //     color: Color(0xFFE9D6C4),
              // ),
              //    ),

              SizedBox(width: 15),

              //     Text(
              //     'Friends',
              //     style: TextStyle(
              //     fontSize: 20,
              //     color: Color(0xFFE9D6C4),
              // ),
              //    ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              // Text('signed in as' + user!.email!),
              Text("Signed in as:"),
              Text("${loggedInUser.firstName} ${loggedInUser.secondName}"),
              Text("${loggedInUser.email}"),

               const Post(
          title: 'My Post',
          rating: '4.9',
          cookTime: '30 min',
          thumbnailUrl:
              'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
        ),
        MaterialButton(
          onPressed: () {
            logout(context);
          },
          color: Colors.deepPurple,
          child: Text('sign out'),
        )
            ],
            ),
          ),

        );
  }
  //  logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LogIn()));
  }

}
