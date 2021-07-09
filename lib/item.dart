import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:guide/rateitem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guide/splashscreen.dart';


import 'map.dart';

class item extends StatefulWidget {
  String name;
  item({Key key, this.lan,this.name}) : super(key: key);
  bool lan;
  @override
  _itemState createState() => _itemState();
}

class _itemState extends State<item> {

  _callNumber() async{
    const number = '01006989743'; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  int _selected=0;
  Color c=Colors.white;
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
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("category").doc(widget.name).snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){return Container();}
          else {
            return ListView(

              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.white24,
                      // width: w*0.05,
                      height: h,
                    ),
                    Container(
                      //color: Colors.yellow,
                      // width: w*0.05,
                      height: h * 0.23,
                      child: Image.network(snapshot.data['photo'][0], width: w * 3,
                        fit: BoxFit.cover,),
                    ),
                    Column(
                      children: [
                        SizedBox(height: h * 0.18,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: w * 0.05,),
                            Container(
                              // alignment: Alignment.topRight,
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(10),

                              ),

                              width: w * 0.25,
                              height: h * 0.1,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(snapshot.data['photo'][1],
                                    ),),
                            ),
                            SizedBox(width: w * 0.24,),
                            CircleAvatar(

                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          map(lat: 30.080738,
                                              long: 31.219346,
                                              snip: "DOKKI")));
                                },
                                child: Icon(
                                  Icons.location_on_outlined,
                                  size: 35,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.black,
                              minRadius: 25,),
                            SizedBox(width: w * 0.02,),
                            CircleAvatar(
                              child: InkWell(
                                onTap: () {
                                  return showDialog(
                                    context: context,
                                    builder: (ctx) =>
                                        AlertDialog(
                                          title: Text("Phone Number"),
                                          content: SelectableText(
                                              snapshot.data['number']
                                              ),
                                          actions: <Widget>[
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel",
                                                style: TextStyle(
                                                    fontSize: 20),),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                _callNumber();
                                                Navigator.pop(context);
                                              },
                                              child: Text("Call",
                                                style: TextStyle(
                                                    fontSize: 20),),
                                            ),
                                          ],
                                        ),
                                  );
                                },
                                child: Icon(
                                  Icons.phone,
                                  size: 30,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              backgroundColor: Colors.black,
                              minRadius: 25,),
                            SizedBox(width: w * 0.02,),
                            CircleAvatar(
                              child: InkWell(
                                onTap: () {
                                  c = Colors.deepOrange;
                                  FirebaseFirestore.instance.collection("account").doc(uid).update({
                                    "favshop": FieldValue.arrayUnion([widget.name])});
                                  setState(() {

                                  });
                                },
                                child: Icon(
                                  Icons.favorite,
                                  size: 30,
                                  color: c,
                                ),
                              ),
                              backgroundColor: Colors.black,
                              minRadius: 25,),

                          ],
                        ),
                        Container(
                          // alignment: Alignment.topLeft,
                          // color: Colors.orange,
                          height: h * 0.2,
                          child: Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 10),
                                  child: Text(snapshot.data["fullname"],
                                    style: TextStyle(fontSize: 30),),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            rateitem(lan: widget.lan,)));
                                  },
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star, size: 20,
                                        color: Colors.deepOrange,),
                                      Icon(Icons.star, size: 20,
                                        color: Colors.deepOrange,),
                                      Icon(Icons.star, size: 20,
                                        color: Colors.deepOrange,),
                                      Icon(Icons.star, size: 20,
                                        color: Colors.deepOrange,),
                                      Icon(Icons.star, size: 20),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 10),
                                  child: Text(snapshot.data['desc'],
                                    style: TextStyle(fontSize: 20),),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 17, top: 10),
                                    child: Icon(
                                      Icons.location_on_outlined, size: 20,
                                      color: Colors.deepOrange,),
                                  ),
                                  Container(

                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 10),
                                      child: Text(snapshot.data['address'],
                                        style: TextStyle(fontSize: 20),),
                                    ),
                                  ),

                                ],
                              ),


                            ],
                          ),
                        ),
                        Divider(
                          // height: h*0.,
                          color: Colors.black,
                          thickness: 3,
                        ),
                        Container(
                          height: 400,
                          child: ListView.builder(
                            itemCount: snapshot.data['subitem'].length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title: Text(snapshot.data['subitem'][index]["name"],
                                    style: TextStyle(fontSize: 20),),
                                  subtitle: Text(
                                    snapshot.data['subitem'][index]["price"], style: TextStyle(fontSize: 20),),
                                  leading: Image(
                                    image: NetworkImage(snapshot.data['subitem'][index]["photo"]),
                                  ),
                                ),
                              );
                            }
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                Container(color: Colors.black,),
              ],
            );
          }
        }
      ),
    );
  }
}
