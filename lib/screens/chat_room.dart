//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatRoom extends StatefulWidget {
  final docs;
  //const ChatRoom({Key, key, this.docs}) : super(key: key);
  ChatRoom({this.docs});
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  ScrollController scrollController = new ScrollController();
  String groupChatId;
  String userId;
  @override
  void initState() {
    getGroupChatId();
    super.initState();
  }

  getGroupChatId() async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //userId = sharedPreferences.getString('uid');
    userId = widget.docs['uid'];
    String anotherUserId = widget.docs['uid'];

    //   if (userId.toString().compareTo(anotherUserId) > 0) {
    if (userId.compareTo(anotherUserId) > 0) {
      groupChatId = '$userId - $anotherUserId';
    } else {
      groupChatId = '$userId - $anotherUserId';
    }
    setState(() {});
  }

  buildItem(doc) {
    return Padding(
      padding: EdgeInsets.only(
          top: 8.0,
          left: ((doc['senderId'] == userId) ? 64 : 0),
          right: ((doc['senderId'] == userId) ? 0 : 64)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color:
                ((doc['sendId'] == userId) ? Colors.grey : Colors.greenAccent),
            borderRadius: BorderRadius.circular(8.0)),
        child: Text('${doc['content']}'),
      ),
    );
  }

  msgSend() {
    String message = sendMsg.text.trim();
    if (message.isNotEmpty) {
      var ref = FirebaseFirestore.instance
          .collection('messages')
          .doc(groupChatId)
          .collection(groupChatId)
          .doc(DateTime.now().millisecondsSinceEpoch.toString());
      FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.set(ref, {
          "senderId": userId,
          "anotherUserId": widget.docs['uid'],
          "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
          'content': message,
          "type": "text",
        });
      });

      scrollController.animateTo(0,
          duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);
    } else {
      print('Error kay wala ka ni send');
    }
  }

  TextEditingController sendMsg = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('messages')
              .doc(groupChatId)
              .collection(groupChatId)
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Column(children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      controller: scrollController,
                      itemBuilder: (listContext, index) =>
                          buildItem(snapshot.data.docs[index]),
                      itemCount: snapshot.data.docs.length,
                      reverse: true),
                ),
                /*----------------------- textfield chat and send button ----------------- */
                Container(
                  child: Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        alignment: Alignment.bottomCenter,
                        width: 300,
                        /*------------------------ TextFiel for Messages  ------------------*/
                        child: TextField(
                          controller: sendMsg,
                          decoration: InputDecoration(
                            hintText: 'Messages...',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      /*------------------------- send button --------------------------------- */
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 60,
                          child: MaterialButton(
                            onPressed: () => msgSend(),
                            color: Colors.blue,
                            child: Text(
                              'SEND',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]);
            } else {
              return Center(
                child: SizedBox(
                  height: 36,
                  width: 36,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              );
            }
          },
        ));
  }
}
