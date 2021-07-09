import 'dart:io';

import 'package:flutter/material.dart';

import 'Offers.dart';
import 'about.dart';
import 'contact.dart';

class Favourite extends StatefulWidget {
  Favourite({Key key, this.lan}) : super(key: key);
  bool lan;
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  int _selected=0;
  void changeselected(int index){
    setState(() {
      _selected = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(

        backgroundColor: Colors.deepOrange,
        // toolbarHeight: 100,

        title: Container(
          alignment: Alignment.topRight,
          child: Text(widget.lan? "Favourite" : "المفضلة",textAlign: TextAlign.right,style:TextStyle(
            color:Colors.white,
            fontSize:h*0.07,
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
              title: Text(widget.lan?'My Profile': "حسابي",
                style: TextStyle(fontSize: 23),),
              onTap: () {
                changeselected(0);
                Navigator.pop(context);
              },
            ),

            ListTile(
              selected: _selected == 1,
              leading: Icon(Icons.favorite,size: 35,),
              title: Text(widget.lan?'Favourite' : "المفضلة",
                style: TextStyle(fontSize: 23),),
              onTap: () {
                changeselected(1);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite()));
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Offers()));

              },
            ),

            ListTile(
              selected: _selected == 3,
              leading: Icon(Icons.account_balance_outlined,size: 35,),
              title: Text(widget.lan?'About' :"التفاصيل",
                style: TextStyle(fontSize: 23),),
              onTap: () {
                changeselected(3);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>about()));
              },
            ),
            ListTile(
              selected: _selected ==4 ,
              leading: Icon(Icons.call,size: 35,),
              title: Text(widget.lan?'Contact us': "تواصل معنا",
                style: TextStyle(fontSize: 23),),
              onTap: () {
                changeselected(4);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>contact()));
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
      body:Center(
        child: Container(
          width: 320,
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Container(
                  height: 220,
                  decoration: BoxDecoration(
                    border: Border.all(width:2),
                  ),
                  child: Image.asset('assets/Image/sand.png')),
              SizedBox(height: 10,),
              Container(
                  height: 220,
                  decoration: BoxDecoration(
                    border: Border.all(width:2),
                  ),
                  child: Image.asset('assets/Image/sand.png')),
              SizedBox(height: 10,),
              Container(
                  height: 220,
                  decoration: BoxDecoration(
                    border: Border.all(width:2),
                  ),
                  child: Image.asset('assets/Image/sand.png')),
              SizedBox(height: 10,),
              Container(
                  height: 220,
                  decoration: BoxDecoration(
                    border: Border.all(width:2),
                  ),
                  child: Image.asset('assets/Image/sand.png')),
              SizedBox(height: 10,),
              Container(
                  height: 220,
                  decoration: BoxDecoration(
                    border: Border.all(width:2),
                  ),
                  child: Image.asset('assets/Image/sand.png')),
              SizedBox(height: 10,),
              Container(
                  height: 220,
                  decoration: BoxDecoration(
                    border: Border.all(width:2),
                  ),
                  child: Image.asset('assets/Image/sand.png')),
            ],
          ),
        ),
      ),
      // Center(
      //   child: Row(
      //     children: [
      //       Icon(Icons.local_fire_department),
      //       Container(
      //         padding: EdgeInsets.only(top: 0,left: 5,bottom: 2),
      //         alignment: Alignment.centerLeft,
      //         child:Text("Offers",style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold,),),
      //       ),
      //     ],
      //   ),
      // ),




      bottomNavigationBar: BottomAppBar(

        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceAround,

          children: [
            InkWell(child: Icon(Icons.account_circle,size: 40,),
              onTap:(){
                Navigator.pop(context);
              },),
            InkWell(child:Icon(Icons.favorite,size: 40,color: Colors.deepOrange,),
              onTap:(){
                Navigator.pop(context);
              },),
            InkWell(
              child:Icon(Icons.home,size: 40,),
              onTap:(){
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),
    );
  }
}
