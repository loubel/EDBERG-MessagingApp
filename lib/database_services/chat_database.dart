import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatMessage {
  getMessages(String chatId, messageMap) {
    FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatId)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
