
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:syedaap/firebase_options.dart';
import 'package:syedaap/login_screen.dart';
import 'package:syedaap/user_fetch.dart';
import 'package:syedaap/user_register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserRegister(),
    );
  }
}


class myHome extends StatefulWidget {
  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {

  TextEditingController Userpassword = TextEditingController();
  TextEditingController UserEmail = TextEditingController();


  void userRegister()async{
    try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Userpassword.text,
        password: UserEmail.text,
    );
    Navigator.push(context, MaterialPageRoute(builder:(context) => LoginScreen(),));
    } on FirebaseAuthException catch(error){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${error.code.toString()}")));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen!"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: TextFormField(
              controller: Userpassword,
            decoration: InputDecoration(
              label: Text("Enter your email"),
              hintText: "Ali@gmail.com",
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(14)
              )
            ),
            ),
          ),

            Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: TextFormField(
            controller: UserEmail,
            decoration: InputDecoration(
            label: Text("Enter your password"),
            hintText: "Ali110abc",
            prefixIcon: Icon(Icons.password),
            border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
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
    print(UserEmail.text);
    print(Userpassword.text);
    userRegister();
    },child: Text("Register"),
    ),
    ),
    ),)
    ],
      ),
    );
  }
}



