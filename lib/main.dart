import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:guide/Offers.dart';
import 'package:guide/Favourite.dart';
import 'package:guide/item.dart';
import 'package:guide/splashscreen.dart';
import 'package:guide/welcome.dart';
import 'about.dart';
import 'contact.dart';
import 'myaccount.dart';
import 'category.dart';
import 'search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';





void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:splashscreen(),
  )
  );
}
class a extends StatefulWidget {
  a({Key key, this.lan}) : super(key: key);
  final bool lan;

  @override
  _aState createState() => _aState();
}

class _aState extends State<a> {
  int _selected=0;
  String ssname= "KFC";
  String fname="Zack's";
  void changeselected(int index){
    setState(() {
      _selected = index;
    });
  }
  TextEditingController q=TextEditingController();
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
              child: Text(widget.lan? "Guide": "المرشد",textAlign: TextAlign.right,style:TextStyle(
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
                title: Text(widget.lan?'My Account':"حسابي",
                style: TextStyle(fontSize: 23),),
                onTap: () {
                  changeselected(0);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>myaccount(lan: widget.lan,)));
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Offers(lan: widget.lan,)));

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
        body: ListView(
        children: [
          Stack(
            children: [
             Container(
              height: h*0.84,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                  bottomRight: Radius.circular(90),
                  topLeft:  Radius.circular(70),
                  topRight: Radius.circular(70),
                )
              ),
            ),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: w*0.15,),
                      Container(
                       height: 35,
                        width: 250,
                      alignment: Alignment.bottomRight,
                      //  color: Colors.white,
                        child: TextField(
                      //   textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                           //maxLines: 5,
                          cursorHeight: 20,
                          controller: q,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 1,0, 0),
                            fillColor: Colors.white,
                              filled: true,
                              hoverColor:Colors.white,
                              hintText: "Search",
                            //  labelText: "Enter Text",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>search(lan: widget.lan,text: q.text)));

                                },
                                icon: Icon(Icons.search),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5,left: 10,bottom: 2),
                    alignment: Alignment.centerLeft,
                    child:Text(widget.lan?"Best Offers" : "افضل العروض",style: TextStyle(fontSize: 25,color:Colors.black,fontWeight: FontWeight.bold,),),
                  ),

                  Container(
                    height: h*0.19,
                    child: ListView(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 20/8,
                            autoPlayCurve:  Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            viewportFraction: 0.6,
                          ),
                          items: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>item(lan: widget.lan,name: ssname,)));

                              },
                              child: Container(
                                // margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(width:2),
                                  ),
                                 // width: w*0.8,
                                  child:ClipRRect(
                                    child: Image.asset('assets/Image/madras.png'),

                                  )

                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>item(lan: widget.lan,name: fname,)));

                              },
                              child: Container(
                                // margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(width:2),
                                  ),
                                  // width: w*0.8,
                                  child:ClipRRect(
                                    child: Image.asset('assets/Image/chips.png'),

                                  )

                              ),
                            ),
                          ],

                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0,left: 10,bottom: 2),
                    alignment: Alignment.centerLeft,
                    child:Text(widget.lan?"Category":"الفئات",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold,),),
                  ),
                  Container(
                    height: 90,
                    child: ListView(
                      //  physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                      shrinkWrap: true,
                      reverse: true,
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>category(lan: widget.lan,)));

                          },
                          child: Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width:2),
                                  ),
                                  child: Image.asset('assets/Image/caf.jpg'),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: h*0.06,),
                                  // Container(
                                  //     padding: EdgeInsets.fromLTRB(25,0, 0, 0),
                                  //     // alignment: Alignment.bottomCenter,
                                  //     child: Text("Cafe",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),)),
                                  // Container(
                                  //     padding: EdgeInsets.fromLTRB(25,0, 0, 0),
                                  //     // alignment: Alignment.bottomRight,
                                  //     child: Text("Restaurant",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),)),
                                ],
                              ),
                            ],

                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>category(lan: widget.lan,)));

                          },
                          child: Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width:2),
                                  ),
                                  child: Image.asset('assets/Image/phar.jpg'),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: h*0.06,),
                                  // Container(
                                  //     padding: EdgeInsets.fromLTRB(25,0, 0, 0),
                                  //     // alignment: Alignment.topLeft,
                                  //     child: Text("Cafe",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),)),
                                  // Container(
                                  //     padding: EdgeInsets.fromLTRB(25,0, 0, 0),
                                  //     // alignment: Alignment.bottomRight,
                                  //     child: Text("Restaurant",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),)),
                                ],
                              ),
                            ],

                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell
                          (
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>category(lan: widget.lan,)));

                          },
                          child: Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width:2),
                                  ),
                                  child: Image.asset('assets/Image/market.png'),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: h*0.06,),
                                  // Container(
                                  //     padding: EdgeInsets.fromLTRB(25,0, 0, 0),
                                  //     // alignment: Alignment.topLeft,
                                  //     child: Text("Cafe",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),)),
                                  // Container(
                                  //     padding: EdgeInsets.fromLTRB(25,0, 0, 0),
                                  //     // alignment: Alignment.bottomRight,
                                  //     child: Text("Restaurant",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),)),
                                ],
                              ),
                            ],

                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>category(lan: widget.lan,)));

                          },
                          child: Stack(
                            children: [
                              Container(

                                  decoration: BoxDecoration(
                                    border: Border.all(width:2),
                                  ),
                                  child: Image.asset('assets/Image/clinc.jpg'),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: h*0.06,),
                                  // Container(
                                  //     padding: EdgeInsets.fromLTRB(25,0, 0, 0),
                                  //     // alignment: Alignment.topLeft,
                                  //     child: Text("Cafe",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),)),
                                  // Container(
                                  //     padding: EdgeInsets.fromLTRB(25,0, 0, 0),
                                  //     // alignment: Alignment.bottomRight,
                                  //     child: Text("Restaurant",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),)),
                                ],
                              ),
                            ],

                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>category(lan: widget.lan,)));

                          },
                          child: Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width:2),
                                  ),
                                  child: Image.asset('assets/Image/football.jpg'),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: h*0.06,),
                                ],
                              ),
                            ],

                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>category(lan: widget.lan,)));

                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width:2),
                                ),
                                child: Image.asset('assets/Image/play.png'),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: h*0.06,),
                                ],
                              ),
                            ],

                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>category(lan: widget.lan,)));

                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width:2),
                                ),
                                child: Image.asset('assets/Image/mobile.jpg'),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: h*0.06,),
                                ],
                              ),
                            ],

                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>category(lan: widget.lan,)));

                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width:2),
                                ),
                                child: Image.asset('assets/Image/bak.jpg'),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: h*0.06,),
                                ],
                              ),
                            ],

                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>category(lan: widget.lan,)));

                          },
                          child: Stack(
                            children: [
                              Container(
                               height: h*01,
                                width: w*0.23,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(width:2),
                                ),
                             //   child: Image.asset('assets/Image/other.jpg'),
                              ),
                              Column(
                               // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                 SizedBox(height: h*0.02,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text("Other",style: TextStyle(color: Colors.red ,fontSize: 20),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text("+",style: TextStyle(color: Colors.red ,fontSize: 30),),
                                  ),
                                ],
                              ),
                            ],

                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5,left: 10,bottom: 2),
                        alignment: Alignment.centerLeft,
                        child:Text(widget.lan?"Offers":"العروض",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold,),),
                      ),
                      SizedBox(width: w*0.57,),
                      Container(
                        padding: EdgeInsets.only(top: 5,left: 10,bottom: 2),
                        alignment: Alignment.centerRight,
                        child:InkWell(
                            child: Text(widget.lan?"See All":"الكل",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold,),),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Offers(lan: widget.lan,)));
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    // height: 1000,
                    width: 350,
                    child: Column(

                      children: <Widget>[
                        Container(
                            height: 220,
                            decoration: BoxDecoration(
                              border: Border.all(width:2),
                            ),
                            child: Image.asset('assets/Image/madras.png'),),
                        SizedBox(height: 10,),
                        Container(
                            height: 220,
                            decoration: BoxDecoration(
                              border: Border.all(width:2),
                            ),
                            child: Image.asset('assets/Image/chips.png'),),
                        SizedBox(height: 10,),
                        Container(
                            height: 220,
                            decoration: BoxDecoration(
                              border: Border.all(width:2),
                            ),
                            child: Image.asset('assets/Image/madras.png'),),
                        SizedBox(height: 10,),
                        Container(
                            height: 220,
                            decoration: BoxDecoration(
                              border: Border.all(width:2),
                            ),
                            child: Image.asset('assets/Image/chips.png'),),
                        SizedBox(height: 10,),
                        Container(
                            height: 220,
                            decoration: BoxDecoration(
                              border: Border.all(width:2),
                            ),
                            child: Image.asset('assets/Image/madras.png'),),


                      ],
                    ),
                  ),


                ],
              ),
            ]
          ),
        ],
        ),





 bottomNavigationBar: BottomAppBar(

   child: Row(
     mainAxisAlignment:  MainAxisAlignment.spaceAround,

     children: [
       InkWell(child: Icon(Icons.account_circle,size: 40,),
        onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>myaccount(lan: widget.lan,)));

        },),
      InkWell(child:Icon(Icons.favorite,size: 40,color: Colors.deepOrange,),
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite(lan: widget.lan,)));

        },),
      InkWell(
          child:Icon(Icons.home,size: 40,),
        onTap:(){
        //  Navigator.pop(context);
        },
      ),

     ],
   ),
 ),
     );
  }
}

