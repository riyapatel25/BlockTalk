import 'package:flutter/material.dart';
import 'package:block_talk/Pages/widgets/Post.dart';
import 'package:google_fonts/google_fonts.dart';
List<Post> posts = [];
class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> with TickerProviderStateMixin {
  late TabController _tabController;
    @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
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
        body: 
        TabBarView(
          controller: _tabController,
          children:  <Widget>[
             Post(title: 'My Post',
                  rating: '4.9',
                  cookTime: '30 min',
                  thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
                  ),
             Post(title: 'My Post',
                  rating: '4.9',
                  cookTime: '30 min',
                  thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
                  ),
          ],     
        ),
    );
  }
}
