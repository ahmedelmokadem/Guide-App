import 'dart:io';
import 'package:guide/Favourite.dart';
import 'package:flutter/material.dart';

import 'Offers.dart';
import 'about.dart';
import 'main.dart';

class contact extends StatefulWidget {
  contact({Key key, this.lan}) : super(key: key);
  bool lan;
  @override
  _contactState createState() => _contactState();
}

class _contactState extends State<contact> {
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
          child: Text(widget.lan?"Contact us" :"تواصل معنا",textAlign: TextAlign.right,style:TextStyle(
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
              title: Text(widget.lan?'Favourite' :"المفضلة",
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
              title: Text(widget.lan?'About' : "التفاصيل",
                style: TextStyle(fontSize: 23),),
              onTap: () {
                changeselected(3);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>about()));
              },
            ),
            ListTile(
              selected: _selected ==4 ,
              leading: Icon(Icons.call,size: 35,),
              title: Text(widget.lan?'Contact us':"تواصل معنا",
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
              title: Text(widget.lan?'Exit' : "خروج",
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
      body: ListView(
        children: [
          SizedBox(height: h*0.01,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
              child: Text(widget.lan?"Follow us on :" : "تابعنا علي :", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
          SizedBox(height: h*0.01,),
          Row(
      //      crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //padding: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 27.0,
                  child: Image(
                    image: AssetImage('assets/Image/face.png'),
                  ),
                ),

              ),
              Container(
              //  padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 27.0,
                  child: Image(
                    image: AssetImage('assets/Image/whats.png'),
                  ),
                ),

              ),
              Container(
                padding: EdgeInsets.only(left: 5,right: 10),
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 20.0,
                  child: Image(
                    image: AssetImage('assets/Image/insta.png'),
                  ),
                ),

              ),
              Container(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 20.0,
                  child: Image(
                    image: AssetImage('assets/Image/m.png'),
                  ),
                ),

              ),

            ],
          ),
          SizedBox(height: h*0.02,),
          Row(
            //      crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                //padding: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 15.0,
                  child: Icon(
                    Icons.phone,
                    size: 20,
                  ),
                ),

              ),
              Container(

                alignment: Alignment.centerLeft,
                child: Text("01005525856",style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
          SizedBox(height: h*0.01,),
          Row(
            //      crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                //padding: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 15.0,
                  child: Icon(
                    Icons.email,
                    size: 20,
                  ),
                ),

              ),
              Container(

                alignment: Alignment.centerLeft,
                child: Text("Ahmedmok@gmail.com",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),

            ],
          ),
          SizedBox(height: h*0.02,),
          Container(
            child:  Divider(
              color: Colors.black,
              height: 2.5,
              thickness: 1.5,
            ),
          ),
          SizedBox(height: h*0.01,),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(widget.lan?"Or send to us :" :"او ارسل لنا :", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30 ,color: Colors.deepOrange),)),
          SizedBox(height: h*0.01,),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(widget.lan?"Name :" : "الاسم :", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.black),)),
          SizedBox(height: h*0.01,),
          Container(
            //  margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              width: w*0.8,
              decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(29)
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: widget.lan?"  Name" : "الاسم  ",
                  border: InputBorder.none,
                ),

              )),
          SizedBox(height: h*0.02,),

          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(widget.lan?"Mobile Number :" : "رقم الموبايل", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.black),)),
          SizedBox(height: h*0.01,),
          Container(
            //  margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              width: w*0.8,
              decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(29)
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  hintText: widget.lan?"  Mobile": " رقم الموبايل",
                  border: InputBorder.none,
                ),

              )),
          SizedBox(height: h*0.02,),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(widget.lan?"Message or problem :" : "رسالة او مشكلة :", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.black),)),
          SizedBox(height: h*0.01,),
          Container(
            //  margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
             //width: w*0.8,
              decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(29)
              ),
              child: TextField(
                maxLines: 10,
                cursorHeight: 30,
                decoration: InputDecoration(
                  hintText: widget.lan?"  Message" : "رسالة",
                  border: InputBorder.none,
                ),

              )),
          SizedBox(height: h*0.02,),
          Container(
            padding: EdgeInsets.only(left: 50,right: 50),
            width: w*0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: FlatButton(
                  color: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                  onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>a()));
                    //Navigator.pop(context);
                  },
                  child: Text(widget.lan?"Send":"ارسل",
                    style: TextStyle(color: Colors.black,fontSize: 20),)),
            ),
          ),
          SizedBox(height: h*0.085,),



        ],
      ),






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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite()));

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
