import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'package:block_talk/Pages/widgets/Post.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  List<Widget> personalPosts = [Container(height: 390, width:150, 
                                          child: Align(alignment: Alignment.center, child: Text('+', style: TextStyle(fontSize: 55,color: Color(0xFF1B191A),),),), 
                                          decoration: BoxDecoration(border: Border.all(width: 1, color:Color(0xFF1B191A)),borderRadius: BorderRadius.circular(10), ),),

                                Container(height: 400, child: Post(title: 'My Post',
                                      rating: '4.9',
                                      cookTime: '30 min',
                                      thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
                                      )),
                                      Container(height: 400, child: Post(title: 'My Post',
                                      rating: '4.9',
                                      cookTime: '30 min',
                                      thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
                                      )),
                                ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [Text("@account_name", style: GoogleFonts.montserrat(fontSize: 24, color: Theme.of(context).colorScheme.secondary),),
                      
                      SizedBox(height: 40),

                      Stack(alignment: Alignment.bottomCenter, children: <Widget>[AppBar(backgroundColor: Theme.of(context).colorScheme.primary,), 
                                            Padding( padding: EdgeInsets.fromLTRB(0, 0, 0, 25), child:Container(height:150, width: 150, child: Icon(Icons.person, size: 100,) ,
                                                      decoration: BoxDecoration(color:Theme.of(context).colorScheme.onSecondary, border: Border.all(width: 1, color: Theme.of(context).colorScheme.secondary), borderRadius: BorderRadius.circular(10),))),
                                            ],),
                        //space
                      SizedBox(height: 10),
                        Align(
                        alignment: Alignment.centerLeft,
                        child:Text("Posts", style: GoogleFonts.montserrat(fontSize: 24, color: Theme.of(context).colorScheme.secondary), textAlign: TextAlign.left,),),
                      
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        height: 400.0,
                        child: ListView( scrollDirection: Axis.horizontal, children: personalPosts),
                      )
                    ]
                  )
                )
              )
            );
  }
}
