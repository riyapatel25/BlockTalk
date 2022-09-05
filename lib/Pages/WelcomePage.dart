
import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'LogIn.dart';

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
            Spacer(flex:5),

            Image.asset('assets/logo.png', scale: 10),

            Text('BlockTalk',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,),
                ),
            
            Spacer(flex:4),
            
            Expanded(
              flex: 2,
              child: TextButton(
                
                style: ButtonStyle(
                                  minimumSize:MaterialStateProperty.all<Size>(Size(300, 50)),
                                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
                                  foregroundColor:  MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignUp()));
                },
                child: Text('Sign Up',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,),
                          )
              )
            ),

           Spacer(flex:1),
            Expanded(
              flex: 2,
              child: TextButton(
                
                style: ButtonStyle(minimumSize:MaterialStateProperty.all<Size>(Size(300, 60)),
                                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onPrimary),
                                  foregroundColor:  MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary)),
                                  
                 onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  LogIn()));
                 },
                child: Text('Log In',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,),
                          )
              )
              ),
            Spacer(flex:3), 
          ]
        )
      ),
    );
  }
}