import 'package:chat_app/services/auth.dart';
import 'package:chat_app/views/signin.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethods authMethods= new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Image.asset(
        'assets/images/logo.png',
        height: 60,
      ),
      actions: [
        GestureDetector(
          onTap: (){
            authMethods.signOut();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
          },
          child: Container(
            child: Icon(Icons.logout),
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        )
      ],
    ));
  }
}
