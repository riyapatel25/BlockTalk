import 'package:flutter/material.dart';
import 'package:block_talk/Pages/widgets/Post.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:block_talk/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'LogIn.dart';

List<Post> posts =  <Post>[Post(title: 'My Post', rating: '4.9', cookTime: '30 min',thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360', postHeight: 400,),
                          Post(title: 'My Post', rating: '4.9', cookTime: '30 min', thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360', postHeight: 180,),
                          Post(title: 'My Post', rating: '4.9', cookTime: '30 min', thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360', postHeight: 240,),
                          ];
                          
class PostPage extends StatefulWidget {
    const PostPage({Key? key}) : super(key: key);
    @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> with TickerProviderStateMixin {
  User? user = FirebaseAuth.instance.currentUser;
  //curent user
  UserModel loggedInUser = UserModel();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
        _tabController = TabController(length: 2, vsync: this);
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
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          shadowColor: Theme.of(context).colorScheme.tertiary,
          title: TabBar(    
          controller: _tabController,
            indicatorColor: Theme.of(context).colorScheme.onPrimary,      
            tabs:  <Widget>[
              Tab(
                icon: Text("My City", style: GoogleFonts.montserrat(fontSize: 20, color: Theme.of(context).colorScheme.onBackground))
              ),
              Tab(
                icon: Text("My Friends", style: GoogleFonts.montserrat(fontSize: 20, color: Theme.of(context).colorScheme.onBackground))
              ),
            ]
          ),
        
        ),
        body: Center(
         child: Column(
            children: [
    
        TabBarView(
          controller: _tabController,
          children: [Container(margin: const EdgeInsets.symmetric(vertical: 20.0),
                                child: ListView( scrollDirection: Axis.vertical, children: posts),), 
                    Container(margin: const EdgeInsets.symmetric(vertical: 20.0), 
                                child: ListView( scrollDirection: Axis.vertical, children: posts),)
                    ],
        ),
            //button here from merge
         MaterialButton(
          onPressed: () {
            logout(context);
          },
          color: Colors.deepPurple,
          child: Text('sign out'),
        ),
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


