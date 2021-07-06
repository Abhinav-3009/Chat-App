import 'package:chat_app/helper/authenticate.dart';
import 'package:chat_app/helper/helperfunctions.dart';
import 'package:chat_app/views/chatroom.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn=false;
  @override
    void initState() {
      getLoggedInState();
      super.initState();
    }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreferene().then((val){
      setState(() {
              userIsLoggedIn=val;
            });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[50],
        primarySwatch: Colors.blue,
      ),
      home:  userIsLoggedIn? ChatRoom(): AUthenticate() ,
    );
  }
}
