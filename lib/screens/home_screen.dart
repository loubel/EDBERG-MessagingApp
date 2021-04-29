import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edberg_messangin_app/screens/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userId;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    SharedPreferences spf = await SharedPreferences.getInstance();

    return userId = spf.getString('uid');
  }

  buildItem(doc) {
    return (userId != doc['uid'])
        ? Card(
            color: Colors.lightBlue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print(doc);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatRoom(
                                docs: doc,
                              )));
                },
                child: Container(
                  child: Text(doc['name']),
                ),
              ),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                itemBuilder: (listContext, index) =>
                    buildItem(snapshot.data.docs[index]),
                itemCount: snapshot.data.docs.length,
              );
            }
            return Container();
          },
        ));
  }
}
