import 'package:chat_app/helper/constants.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomId;
  ConversationScreen({@required this.chatRoomId});

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  DataBaseMethods dataBaseMethods = new DataBaseMethods();
  TextEditingController messageController = new TextEditingController();
  Stream chatMessageStream;
  Widget ChatMessageList() {
    return StreamBuilder(
      stream: chatMessageStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                      message: snapshot.data.documents[index].data["message"],
                      isSendByMe:
                          snapshot.data.documents[index].data["sendBy"] ==
                              Constants.MyName);
                })
            : Container();
      },
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sendBy": Constants.MyName,
        "time": DateTime.now().millisecondsSinceEpoch
      };
      dataBaseMethods.addConversationMessages(widget.chatRoomId, messageMap);
      setState(() {
        messageController.text = "";
      });
    }
  }

  @override
  void initState() {
    dataBaseMethods.getConversationMessages(widget.chatRoomId).then((val) {
      setState(() {
        chatMessageStream = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Stack(
          children: [
            ChatMessageList(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.blue[100],
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Type Here..."),
                    )),
                    InkWell(
                      onTap: () {
                        sendMessage();
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5),
                          child: Image.asset("assets/images/send.png")),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool isSendByMe;
  MessageTile({this.message, this.isSendByMe});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9,horizontal: 8),
      width: MediaQuery.of(context).size.width,
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22,vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSendByMe
                ? [
                    const Color(0xff007EF4),
                    const Color(0xff2A75BC),
                  ]
                : [
                    const Color(0xff616161),
                    const Color(0xff424242),
                  ], //Colors.grey
          ),
          borderRadius: BorderRadius.circular(22)
        ),
        child: Text(
          message,
          style: TextStyle(fontSize: 22,color: Colors.white),
        ),
      ),
    );
  }
}
