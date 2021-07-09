import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

Future loginfunc(String email , String password)async
{
  try{

    UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    return user;

  }
  catch (e){
    print(e.toString());
    return null;
  }

}

Future logout()async
{
  try{

    await FirebaseAuth.instance.signOut();
  }
  catch (e){
    print(e.toString());
    return null;
  }

}

Future signupfunc(String email , String password, String name , String mobile)async
{
  try{

    UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    await FirebaseFirestore.instance.collection("account").doc(user.uid).set({
      "name" : name ,
      "mobile" : mobile,
      "email" : email,
    });
    return user;

  }
  catch (e){
    print(e.toString());
    return null;
  }

}


