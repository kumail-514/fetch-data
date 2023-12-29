import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController Useremail = TextEditingController();
  TextEditingController Userpassword = TextEditingController();

  void user_signin()async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Useremail.text,
        password: Userpassword.text,
    );
    Navigator.push(context, MaterialPageRoute(builder:(context) => Mydashboard(),));
    Useremail.clear();
    Userpassword.clear();
  } on FirebaseAuthException catch(err){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${err.code.toString()}"),));
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: TextFormField(
              controller: Useremail,
              decoration: InputDecoration(
                  label: Text("Enter Your Email"),
                  hintText: "johndoe@gmail.com",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(14)
                  )
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: TextFormField(
              controller: Userpassword,
              decoration: InputDecoration(
                  label: Text("Enter Your Password"),
                  hintText: "12**BA@",
                  prefixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                      borderRadius: BorderRadius.circular(14)
                  )
              ),
            ),
          ),

          Center(
            child: Container(
              width: 120,
              height: 40,
              child: Center(
                child: ElevatedButton(onPressed: (){
                  print(Useremail.text);
                  print(Userpassword.text);
                  user_signin();
                }, child: Text("Login")),
              ),
            ),
          )
        ],
      ),
    );();
  }
}



