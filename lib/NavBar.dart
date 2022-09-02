import 'package:block_talk/Pages/PostPage.dart';
import 'package:block_talk/Pages/Profile.dart';
import 'package:flutter/material.dart';
import 'package:block_talk/Pages/widgets/Post.dart';

import 'package:google_fonts/google_fonts.dart';
import 'Pages/Welcome.dart';
import 'Pages/SignUp.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  static  TextStyle optionStyle = GoogleFonts.montserrat(fontSize: 20, color: Color(0xFFF5F2F3));

  static List<Widget> _widgetOptions = <Widget>[
    PostPage(), WelcomePage(), Profile(),
  ];

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
       body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
       bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label:'Home', backgroundColor: Theme.of(context).colorScheme.tertiary,),
        BottomNavigationBarItem(icon: Icon(Icons.map), label:'Map', backgroundColor: Theme.of(context).colorScheme.primary,),
        BottomNavigationBarItem(icon: Icon(Icons.person), label:'Profile', backgroundColor: Theme.of(context).colorScheme.primary,),
       ],
       currentIndex: _selectedIndex,
       type: BottomNavigationBarType.shifting,
       selectedItemColor: Theme.of(context).colorScheme.onPrimary,
       onTap: _onItemTapped,),
       
    );
  }
}
