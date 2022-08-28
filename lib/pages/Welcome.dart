import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget{
  Widget build (BuildContext context){
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container( 
        alignment: Alignment.center,
        child: Column(
    
         // mainAxisAlignment: MainAxisAlignment.center,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex:4),

            Image.asset('assets/logo.png', scale: 10),

            Spacer(flex:4),
            
            Expanded(
              flex: 1,
              child: TextButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
                                  foregroundColor:  MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary)),
                onPressed: (){},
                child: Text('Sign Up'),
              )
            ),

           //Spacer(flex:1),
            Expanded(
              flex: 1,
              child: TextButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onPrimary),
                                  foregroundColor:  MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary)),
                 onPressed: (){},
                child: Text('Log In'),
              )
            ), 

            Spacer(flex:4), 
          ]
        )
      ),
    );
  }
}