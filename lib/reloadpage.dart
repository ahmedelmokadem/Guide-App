import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guide/myaccount.dart';
import 'dart:async';

import 'package:guide/welcome.dart';

class reloadpage extends StatefulWidget {
  reloadpage({Key key, this.lan}) : super(key: key);
  bool lan;
  @override
  _reloadpageState createState() => _reloadpageState();
}

class _reloadpageState extends State<reloadpage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 1),()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>myaccount(lan: widget.lan,))));
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
