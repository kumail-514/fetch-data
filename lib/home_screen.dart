import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syedaap/login_screen.dart';

class Mydashboard extends StatefulWidget {
  const Mydashboard({super.key});

  @override
  State<Mydashboard> createState() => _MydashboardState();
}

class _MydashboardState extends State<Mydashboard> {
  @override
  Widget build(BuildContext context) {

    void userLogut()async{
      await FirebaseAuth.instance.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${FirebaseAuth.instance.currentUser!.email.toString()}"),
      ),

      body: Column(
        children: [
          TextButton(onPressed: (){
           userLogut();
           }, child: Text("LogOut"))
        ],
      ),
    );
  }
}

