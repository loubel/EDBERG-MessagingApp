import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

/* ----------- login with firebase authentication ----------- */
Future<bool> login(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

/* ----------- register with firebase authentication ----------- */
Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'Weak password') {
      print('The password is weak');
    } else if (e.code == 'email-already in use') {
      print('The account is already exist');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

/* ----------- add users in firestore ----------- */
Future<void> addUser(String userName, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({'email': userName, 'name': email, 'uid': uid});
  return;
}
