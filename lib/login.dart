import 'package:flutter/material.dart';
import 'package:guide/Signup.dart';
import 'package:guide/firebase.dart';
import 'package:guide/main.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final bool lang=true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
String e = "";
  bool v = true;

  @override
  Widget build(BuildContext context) {
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login",
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
                   controller: email,
                   decoration: InputDecoration(
                     icon: Icon(
                       Icons.person,
                       color: Colors.black,
                     ),
                     hintText: "  Email",
                     border: InputBorder.none,
                   ),

                 )),
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
                    obscureText: true,
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
                      var log = await loginfunc(email.text, password.text);
                      if(log == null){
                        e = "Email or Password are incorrect";
                      } else {e = ""; print("done");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>a(lan: lang,)));}
                      setState(() {});
                      //
                        //Navigator.pop(context);
                      },
                      child: Text("Login",
                        style: TextStyle(color: Colors.black),)),
                ),
              ),
              SizedBox(height: h*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ? "),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                    },
                      child: Text("Sign up",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange
                      ),)),
                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}
