
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syedaap/user_register.dart';



class MyHomee extends StatefulWidget {
  const MyHomee({super.key});

  @override
  State<MyHomee> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Data"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(
            height: 30,
          ),

          Center(
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UserRegister(),));
            }, child: Text("Add New USer")),
          ),

          const SizedBox(
            height: 30,
          ),
          
          



        ],
      ),
    );
  }
}

