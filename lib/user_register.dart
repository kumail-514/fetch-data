import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syedaap/user_fetch.dart';
import 'package:uuid/uuid.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {

   TextEditingController Username = TextEditingController();
   TextEditingController Useremail = TextEditingController();
   TextEditingController Userpassword = TextEditingController();

//   void addUSer()async{
//
//     Map<String, dynamic> uAdd = {
//       "Username" : Username.text,
//       "Useremail": Useremail.text,
//       "Userpassword": Userpassword.text
//     };
//     await FirebaseFirestore.instance.collection("userData").add(uAdd);
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Add")));

    void CustomID()async{
      var userID = Uuid().v1();
      
      Map<String, dynamic> uAdd = {
        "UserId" : userID,
        "Username" : Username.text,
        "Useremail": Useremail.text,
        "Userpassword": Userpassword.text,
      };
      await FirebaseFirestore.instance.collection("userData").doc(userID).set(uAdd);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Added")));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: TextFormField(
              controller: Username,
              decoration: InputDecoration(
                  label: Text("Enter your name"),
                  hintText: "Ali",
                  prefixIcon: Icon(Icons.person),
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
              controller: Useremail,
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
              controller: Userpassword,
              decoration: InputDecoration(
                  label: Text("Enter your password"),
                  hintText: "Ali@1234",
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
                  CustomID();
                },child: Text("USer Added"),
                ),
              ),
            ),),

          StreamBuilder(
              stream: FirebaseFirestore.instance.collection("userData").snapshots(),
              builder: (context, snapshot) {

                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                }

                if(snapshot.hasData){
                  var datalenght = snapshot.data!.docs.length;
                  return ListView.builder(
                    itemCount: datalenght,
                    shrinkWrap: true,
                    itemBuilder:(context, index){
                      String userName = snapshot.data!.docs[index]["Username"];
                      String userEmail = snapshot.data!.docs[index]["Useremail"];

                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text(userName),
                        subtitle: Text(userEmail),
                      );
                    },);
                }

                if(snapshot.hasError){
                  return Icon(Icons.error, color: Colors.red,);
                }

                return Container();
              })
        ],
      ),
    );
  }
}
