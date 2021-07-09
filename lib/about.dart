import 'dart:io';
import 'package:guide/Favourite.dart';
import 'package:flutter/material.dart';

import 'Offers.dart';
import 'contact.dart';

class about extends StatefulWidget {
  about({Key key, this.lan}) : super(key: key);
  bool lan;
  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
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
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar:AppBar(

          backgroundColor: Colors.deepOrange,
          // toolbarHeight: 100,

          title: Container(
            alignment: Alignment.topRight,
            child: Text(widget.lan? "About" : "التفاصيل",textAlign: TextAlign.right,style:TextStyle(
              color:Colors.white,
              fontSize:h*0.07,
              fontWeight: FontWeight.bold,

            ) ,),
          ),
          bottom:TabBar(
            indicatorColor: Colors.white,
            // indicator: BoxDecoration(borderRadius: BorderRadius.circular(30)  ),
            unselectedLabelColor: Colors.grey[500],
            tabs: [
              Text(widget.lan? "About us" : "تفاصيل عنا",style:TextStyle(
            color:Colors.white,
            fontSize:h*0.03,
            fontWeight: FontWeight.bold,

          ) ,),
              Text(widget.lan? "About App" : "تفاصيل التطبيق",style:TextStyle(
                color:Colors.white,
                fontSize:h*0.03,
                fontWeight: FontWeight.bold,

              ) ,),

            ],
          ),
        ),
        // drawer: Drawer(
        //   child: ListView(
        //     // Important: Remove any padding from the ListView.
        //     padding: EdgeInsets.zero,
        //     children: <Widget>[
        //       DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.deepOrange,
        //         ),
        //         child: Column(
        //           children: [
        //             //  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190322-ham-sandwich-horizontal-1553721016.png'
        //             Container(
        //               // width: 500,
        //               child: CircleAvatar(
        //                 maxRadius: 40,
        //                 backgroundImage: AssetImage('assets/Image/1.jpg'),
        //               ),
        //             ),
        //             SizedBox(height: h*0.01,),
        //             Text('Ahmed'),
        //             SizedBox(height: h*0.01,),
        //             Text('Ahmedmok@gmail.com'),
        //           ],
        //         ),
        //       ),
        //       ListTile(
        //         selected: _selected == 0,
        //         leading: Icon(Icons.account_circle,size: 35,),
        //         title: Text('My Profile',
        //           style: TextStyle(fontSize: 23),),
        //         onTap: () {
        //           changeselected(0);
        //           Navigator.pop(context);
        //         },
        //       ),
        //
        //       ListTile(
        //         selected: _selected == 1,
        //         leading: Icon(Icons.favorite,size: 35,),
        //         title: Text('Favourite',
        //           style: TextStyle(fontSize: 23),),
        //         onTap: () {
        //           changeselected(1);
        //           Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite()));
        //         },
        //       ),
        //       new Divider(
        //         thickness: 3,
        //         indent: 10,
        //         endIndent: 10,
        //       ),
        //       ListTile(
        //         selected: _selected == 2,
        //         leading: Icon(Icons.local_fire_department,size: 35,),
        //         title: Text('Offers',
        //           style: TextStyle(fontSize: 23),),
        //         onTap: () {
        //           changeselected(2);
        //           Navigator.push(context, MaterialPageRoute(builder: (context)=>Offers()));
        //
        //         },
        //       ),
        //
        //       ListTile(
        //         selected: _selected == 3,
        //         leading: Icon(Icons.account_balance_outlined,size: 35,),
        //         title: Text('About',
        //           style: TextStyle(fontSize: 23),),
        //         onTap: () {
        //           changeselected(3);
        //           Navigator.push(context, MaterialPageRoute(builder: (context)=>about()));
        //         },
        //       ),
        //       ListTile(
        //         selected: _selected ==4 ,
        //         leading: Icon(Icons.call,size: 35,),
        //         title: Text('Contact us',
        //           style: TextStyle(fontSize: 23),),
        //         onTap: () {
        //           changeselected(4);
        //           Navigator.push(context, MaterialPageRoute(builder: (context)=>contact()));
        //         },
        //       ),
        //       new Divider(
        //         thickness: 3,
        //         indent: 10,
        //         endIndent: 10,
        //       ),
        //       ListTile(
        //         // selected: _selected == 5,
        //         leading: Icon(Icons.exit_to_app,size: 35,),
        //         title: Text('Exit',
        //           style: TextStyle(fontSize: 23),),
        //         onTap: () {
        //           exit(0);
        //           changeselected(4);
        //           Navigator.pop(context);
        //         },
        //       ),
        //
        //
        //     ],
        //   ),
        // ),
        body:  TabBarView(
          children: [
            Stack(
              children: [
                Container(
                color: Colors.white,
                height: 650,),
                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(widget.lan? "Guide :" : "المرشد :", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.black),)),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(widget.lan? "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ," :
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "", style: TextStyle(fontSize: 15 ,color: Colors.black),)),
                  ],
                ),

              ],
            ),

            Stack(
              children: [Container(
                color: Colors.deepOrange,
                height: 650,),
                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(widget.lan? "Guide :" : "المرشد :", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.black),)),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(widget.lan? "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ,"
                            "Giude is an application for help pepole to find their need easily and quicly ," :
                        "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                            "سثبسثبسبستنيتنشسيشسيتنلاشستنيلاشتنسيلايشسيشسيشسيشسيشسيشسيشسيشسيشسيشسيشسي"
                          "", style: TextStyle(fontSize: 15 ,color: Colors.black),)),
                  ],
                ),
              ],
            ),

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

      ),
    );
  }
}
