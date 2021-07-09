import 'dart:io';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:guide/Favourite.dart';
import 'package:flutter/material.dart';
import 'package:guide/reviews.dart';
import 'dart:async';
import 'about.dart';
import 'contact.dart';
import 'editprofile.dart';
import 'splashscreen.dart';
import 'login.dart';
import 'reloadpage.dart';
import 'package:guide/main.dart';
import 'package:guide/firebase.dart';



class myaccount extends StatefulWidget {
  myaccount({Key key, this.lan}) : super(key: key);
  bool lan;
  @override
  _myaccountState createState() => _myaccountState();
}

class _myaccountState extends State<myaccount> {
 //bool lan=false;
// var language="";
  int _selected=0;
  void chanelang(var index){
    setState(() {
      var lang = index;
      if(lang=="ar")
        {
          widget.lan=!widget.lan;
        }
      else{
       // lan=!lan;
      }
    });
  }
  void changeselected(int index){
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    int sss=50;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(

        backgroundColor: Colors.deepOrange,
        // toolbarHeight: 100,

        title: Container(
          alignment: Alignment.topRight,
          child: Text(widget.lan? "My Account" : "حسابي",textAlign: TextAlign.right,style:TextStyle(
            color:Colors.white,
            fontSize:h*0.05,
            fontWeight: FontWeight.bold,

          ) ,),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Column(
                children: [
                  //  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190322-ham-sandwich-horizontal-1553721016.png'
                  Container(
                    // width: 500,
                    child: CircleAvatar(
                      maxRadius: 40,
                      backgroundImage: AssetImage('assets/Image/1.jpg'),
                    ),
                  ),
                  SizedBox(height: h*0.01,),
                  Text('Ahmed'),
                  SizedBox(height: h*0.01,),
                  Text('Ahmedmok@gmail.com'),
                ],
              ),
            ),
            ListTile(
              selected: _selected == 0,
              leading: Icon(Icons.account_circle,size: 35,),
              title: Text(widget.lan?'My Profile':"حسابي",
                style: TextStyle(fontSize: 23),),
              onTap: () {
                changeselected(0);
                Navigator.pop(context);
              },
            ),

            ListTile(
              selected: _selected == 1,
              leading: Icon(Icons.favorite,size: 35,),
              title: Text(widget.lan?'Favourite':"المفضلة",
                style: TextStyle(fontSize: 23),),
              onTap: () {
                changeselected(1);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite(lan: widget.lan,)));
              },
            ),
            new Divider(
              thickness: 3,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              selected: _selected == 2,
              leading: Icon(Icons.local_fire_department,size: 35,),
              title: Text(widget.lan?'Offers':"العروض",
                style: TextStyle(fontSize: 23),),
              onTap: () {
                changeselected(2);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>myaccount(lan: widget.lan,)));

              },
            ),

            ListTile(
              selected: _selected == 3,
              leading: Icon(Icons.account_balance_outlined,size: 35,),
              title: Text(widget.lan?'About':"التفاصيل",
                style: TextStyle(fontSize: 23),),
              onTap: () {
                changeselected(3);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>about(lan: widget.lan,)));
              },
            ),
            ListTile(
              selected: _selected ==4 ,
              leading: Icon(Icons.call,size: 35,),
              title: Text(widget.lan?'Contact us':"تواصل معنا",
                style: TextStyle(fontSize: 23),),
              onTap: () {
                changeselected(4);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>contact(lan: widget.lan,)));
              },
            ),
            new Divider(
              thickness: 3,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              // selected: _selected == 5,
              leading: Icon(Icons.exit_to_app,size: 35,),
              title: Text(widget.lan?'Exit':"خروج",
                style: TextStyle(fontSize: 23),),
              onTap: () {
                exit(0);
                changeselected(4);
                Navigator.pop(context);
              },
            ),


          ],
        ),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //SizedBox(height: h*0.01,),
          Container(
            width: w*0.999,
            height: h*0.23,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topLeft:  Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
            ),

            child:  Column(
              children: [
                //  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190322-ham-sandwich-horizontal-1553721016.png'
                Container(
                  // width: 500,
                  child: CircleAvatar(
                    maxRadius: 40,
                    backgroundImage: AssetImage('assets/Image/1.jpg'),
                  ),
                ),
                SizedBox(height: h*0.01,),
                Text(email.substring(0,email.indexOf("@")),style: TextStyle(fontSize: 20),),
                SizedBox(height: h*0.01,),
                Text(email,style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
          SizedBox(height: h*0.015,),
          Container(
            width: w*0.9,
            height: h*0.08,
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(5)
            ),
            child: InkWell(
              child: Row(
                children: [
                  SizedBox(width: w*0.015,),
                  Icon(Icons.account_circle, size: 30,),
                  SizedBox(width: w*0.03,),
                  Text(widget.lan?"Edit Account":"تعديل الحساب",style:TextStyle(
                    color:Colors.black,
                    fontSize:h*0.03,
                    fontWeight: FontWeight.bold,

                  ) ,),
                  SizedBox(width: widget.lan? w*0.35 : w*0.32,),
                  InkWell(

                      child: Icon(Icons.arrow_forward_outlined, size: 30,)),

                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>editprofile(lan: widget.lan,)));
              },
            ),
          ),   //1
          SizedBox(height: h*0.015,),
          Container(
            width: w*0.9,
            height: h*0.08,
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(5)
            ),
            child: InkWell(
              child: Row(
                children: [
                  SizedBox(width: w*0.015,),
                  Icon(Icons.favorite, size: 30,),
                  SizedBox(width: w*0.03,),
                  Text(widget.lan?"Favourite" : "المفضلة",style:TextStyle(
                    color:Colors.black,
                    fontSize:h*0.03,
                    fontWeight: FontWeight.bold,

                  ) ,),
                  SizedBox(width: widget.lan? w*0.435 : w*0.46,),
                  InkWell(

                      child: Icon(Icons.arrow_forward_outlined, size: 30,)),

                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite(lan: widget.lan,)));
              },
            ),
          ),  //2
          SizedBox(height: h*0.015,),
          Container(
            width: w*0.9,
            height: h*0.08,
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(5)
            ),
            child: InkWell(
              child: Row(
                children: [
                  SizedBox(width: w*0.015,),
                  Icon(Icons.rate_review, size: 30,),
                  SizedBox(width: w*0.03,),
                  Text(widget.lan?"Reviews" : "الاراء",textAlign: TextAlign.right,style:TextStyle(
                    color:Colors.black,
                    fontSize:h*0.03,
                    fontWeight: FontWeight.bold,

                  ) ,),
                  SizedBox(width: widget.lan? w*0.47:w*0.53,),
                  InkWell(

                      child: Icon(Icons.arrow_forward_outlined, size: 30,)),

                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>reviews(lan: widget.lan,)));

              },
            ),
          ),//5
          SizedBox(height: h*0.015,),
          Container(
            width: w*0.9,
            height: h*0.08,
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(5)
            ),
            child: InkWell(
              child: Row(
                children: [
                  SizedBox(width: w*0.015,),
                  Icon(Icons.phone, size: 30,),
                  SizedBox(width: w*0.03,),
                  Text(widget.lan?"Contact us" : "تواصل معنا",style:TextStyle(
                    color:Colors.black,
                    fontSize:h*0.03,
                    fontWeight: FontWeight.bold,

                  ) ,),
                  SizedBox( width: widget.lan? w*0.392 : w*0.36,),
                  InkWell(

                      child: Icon(Icons.arrow_forward_outlined, size: 30,)),

                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>contact(lan: widget.lan,)));

              },
            ),
          ),//3
          SizedBox(height: h*0.015,),
          Container(
            width: w*0.9,
            height: h*0.08,
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(5)
            ),
            child: InkWell(
              child: Row(
                children: [
                  SizedBox(width: w*0.015,),
                  Icon(Icons.language, size: 30,),
                  SizedBox(width: w*0.03,),
                  Text(widget.lan?"Change Language":"تغير اللغة",style:TextStyle(
                    color:Colors.black,
                    fontSize:h*0.03,
                    fontWeight: FontWeight.bold,

                  ) ,),
                  SizedBox(width: widget.lan? w*0.22 :  w*0.38,),
                  InkWell(

                      child: Icon(Icons.arrow_forward_outlined, size: 30,)),

                ],
              ),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>contact()));
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>reloadpage(lan: widget.lan,)));
                  chanelang("ar");
                  //   sleep(Duration(seconds: 1));

                  //   lan=!lan;

                });
              },
            ),
          ),//4
          SizedBox(height: h*0.015,),
          Container(
            width: w*0.9,
            height: h*0.08,
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(5)
            ),
            child: InkWell(
              child: Row(
                children: [
                  SizedBox(width: w*0.015,),
                  Icon(Icons.logout, size: 30,),
                  SizedBox(width: widget.lan? w*0.03 : w*0.03,),
                  Text(widget.lan? "Log out" : "تسجيل خروج",style:TextStyle(
                    color:Colors.black,
                    fontSize:h*0.03,
                    fontWeight: FontWeight.bold,

                  ) ,),
                  SizedBox(width: widget.lan? w*0.47 : w*0.31,),
                  InkWell(

                      child: Icon(Icons.arrow_forward_outlined, size: 30,)),

                ],
              ),
              onTap:()async{
                await logout();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));

              },
            ),
          ),//6


        ],
      ),

      bottomNavigationBar: BottomAppBar(

        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceAround,

          children: [
            InkWell(child: Icon(Icons.account_circle,size: 40,),
              onTap:(){
               },),
            InkWell(child:Icon(Icons.favorite,size: 40,color: Colors.deepOrange,),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite(lan: widget.lan,)));

              },),
            InkWell(
              child:Icon(Icons.home,size: 40,),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>a(lan: widget.lan,)));

              },
            ),

          ],
        ),
      ),
    );
  }
}
