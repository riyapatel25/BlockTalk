import 'package:flutter/material.dart';
import 'package:block_talk/views/widgets/Post.dart';


class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7D5C65),
          shadowColor:  Color(0xFF808767) ,
          title: Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
        //button 1
              TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                    return Color.fromARGB(255, 129, 111, 116); // Use the component's default.
                  },
                ),
            ),
            onPressed: () { },
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
                    if (states.contains(MaterialState.pressed)) return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                    return Color.fromARGB(255, 129, 111, 116); // Use the component's default.
                  },
                ),
            ),
            onPressed: () { },
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
        
        body: const Post(
          title: 'My Post',
          rating: '4.9',
          cookTime: '30 min',
          thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
        ));
  }
}