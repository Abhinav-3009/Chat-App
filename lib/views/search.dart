import 'package:chat_app/services/database.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DataBaseMethods dataBaseMethods = new DataBaseMethods();
  TextEditingController searchTextEditingController= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.blue[100],
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
              child: Row(
                children: [
                  Expanded(child: TextField(
                    controller: searchTextEditingController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Username.."

                    ),
                  )),
                  GestureDetector(
                    onTap: (){
                      dataBaseMethods.getUserByUsername(searchTextEditingController.text).then((val){
                        print(val.toString());
                      });
                    },
                                      child: Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(5),
                      child: Image.asset("assets/images/search_white.png")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
