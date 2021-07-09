import 'package:flutter/material.dart';
import 'package:guide/main.dart';

import 'Signup.dart';
import 'login.dart';

class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Welcome to Guide",
               style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30,color: Colors.deepOrange),),
               SizedBox(height: h*0.01,),
               Image.asset('assets/Image/login.jpg'),
               // Image(
               //   image: AssetImage('assets/Image/login.jpg'),
               // ),
               SizedBox(height: h*0.06,),
               Container(
                 width: w*0.8,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(29),
                   child: FlatButton(
                       color: Colors.deepOrange,
                       padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                         //Navigator.pop(context);
                       },
                       child: Text("Login",
                       style: TextStyle(color: Colors.white),)),
                 ),
               ),
               SizedBox(height: h*0.02,),
               Container(
                 width: w*0.8,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(29),
                   child: FlatButton(
                       color: Colors.deepOrange,
                       padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                         //Navigator.pop(context);
                       },
                       child: Text("Sign up",
                         style: TextStyle(color: Colors.black),)),
                 ),
               ),



             ],
          ),
        ),
      ),
    );
  }
}
