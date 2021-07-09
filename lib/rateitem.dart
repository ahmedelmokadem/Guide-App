import 'package:flutter/material.dart';

import 'item.dart';

class rateitem extends StatefulWidget {
  rateitem({Key key, this.lan}) : super(key: key);
  bool lan;
  @override
  _rateitemState createState() => _rateitemState();
}

class _rateitemState extends State<rateitem> {
  void changecolor(var cc){
    if(cc==1)
      {
        c1=Colors.deepOrange;
      }
    if(cc==2)
    {
      c1=Colors.deepOrange;
      c2=Colors.deepOrange;
    }
    if(cc==3)
    {
      c1=Colors.deepOrange;
      c2=Colors.deepOrange;
      c3=Colors.deepOrange;
    }
    if(cc==4)
    {
      c1=Colors.deepOrange;
      c2=Colors.deepOrange;
      c3=Colors.deepOrange;
      c4=Colors.deepOrange;
    }
    if(cc==5)
    {
      c1=Colors.deepOrange;
      c2=Colors.deepOrange;
      c3=Colors.deepOrange;
      c4=Colors.deepOrange;
      c5=Colors.deepOrange;
    }

  }

  Color c1=Colors.black;
  Color c2=Colors.black;
  Color c3=Colors.black;
  Color c4=Colors.black;
  Color c5=Colors.black;
  int c=0;
  @override
  Widget build(BuildContext context) {
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
           // alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left:50,right: 8),
              child: Text("Zack's Fried Chicken",style: TextStyle(fontSize: 40),),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left:50,top: 15),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Rate us",style: TextStyle(fontSize: 30),),
                SizedBox(width: w*0.1,),
                InkWell(
                  onTap: (){
                    c=1;
                    changecolor(c);
                    setState(() {});
                  },
                    child: Icon(Icons.star,size: 30,color: c1,)),
                InkWell(
                    onTap: (){
                      c=2;
                      changecolor(c);
                      setState(() {});
                    },
                    child: Icon(Icons.star,size: 30,color: c2,)),
                InkWell(
                    onTap: (){
                      c=3;
                      changecolor(c);
                      setState(() {});
                    },
                    child: Icon(Icons.star,size: 30,color: c3,)),
                InkWell(
                    onTap: (){
                      c=4;
                      changecolor(c);
                      setState(() {});
                    },
                    child: Icon(Icons.star,size: 30,color: c4,)),
                InkWell(
                    onTap: (){
                      c=5;
                      changecolor(c);
                      setState(() {});
                    },
                    child: Icon(Icons.star,size: 30,color: c5,)),
              ],
            ),
          ),
          SizedBox(height: h*0.05,),
          RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>item(lan: widget.lan,)));},child: Text("Done"),),
        ],
      ),
    );
  }
}
