import 'package:flutter/material.dart';
import 'package:guide/main.dart';

import 'firebase.dart';
import 'login.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  String e = "";
  bool v = true;
  @override
  Widget build(BuildContext context) {
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign up",
                  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30,color: Colors.deepOrange),),
                Image(
                  image: AssetImage('assets/Image/login.jpg'),
                ),
                Container(
                  //  margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    width: w*0.8,
                    decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(29)
                    ),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        hintText: "  Name",
                        border: InputBorder.none,
                      ),

                    )),
                SizedBox(height: h*0.02,),
                Container(
                  //  margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    width: w*0.8,
                    decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(29)
                    ),
                    child: TextField(
                      controller: mobile,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        hintText: "  Mobile",
                        border: InputBorder.none,
                      ),

                    )),
                SizedBox(height: h*0.02,),
                Container(
                  //  margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    width: w*0.8,
                    decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(29)
                    ),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: "  Email",
                        border: InputBorder.none,
                      ),

                    )),
                SizedBox(height: h*0.02,),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    width: w*0.8,
                    decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(29)
                    ),
                    child: TextField(
                      controller: password,
                      obscureText: v,
                      decoration: InputDecoration(

                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.visibility,
                            color:Colors.black,
                          ),
                          onPressed: () {v=!v;
                          setState(() {

                          });},
                        ),
                        hintText: "  Password",
                        border: InputBorder.none,
                      ),


                    )),
                Text(e,style: TextStyle(color:Colors.red)),
                SizedBox(height: h*0.02,),

                Container(
                  width: w*0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                        color: Colors.deepOrange,
                        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                        onPressed: ()async{
                          var log = await signupfunc(email.text, password.text,name.text,mobile.text);
                          if(log == null){
                            e = "Password must be more than 5 characters";
                          } else {e = ""; print("done");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>a(lan: true,)));}
                          setState(() {});
                          //
                          //Navigator.pop(context);
                        },
                        child: Text("Sign up",
                          style: TextStyle(color: Colors.black),)),
                  ),
                ),
                SizedBox(height: h*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ? "),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                        },
                        child: Text("Sign in",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange
                        ),)),
                  ],
                ),

                SizedBox(height: h*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Divider(
                        color: Colors.black,
                        height: 2.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("OR",style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    Expanded(
                      flex: 1,
                      child: Divider(
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h*0.01,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Using "),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                        },
                        child: Text("mobile number",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange
                        ),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
