import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:guide/main.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:guide/welcome.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>check())));
  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>welcome()));

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(decoration: BoxDecoration(color: Colors.deepOrange)
            ,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50.0,
                          child: Icon(
                            Icons.menu_book,
                            size: 70,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text("Guide",style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),backgroundColor: Colors.black,),
                      Padding(padding: EdgeInsets.only(top: 20)),

                    ],
                  ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: FirebaseAuth.instance.authStateChanges(),
      child: Wrapper(),
    );
  }
}

String email = "";
String uid = "";
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user == null) {return welcome();} else {email = user.email; uid = user.uid; return a(lan: true,);}
  }
}
