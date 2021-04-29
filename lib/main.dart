<<<<<<< HEAD
import 'package:edberg_messangin_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
=======
import 'package:flutter/material.dart';
import 'package:msg_app/screens/welcomeScreen.dart';

void main() {
>>>>>>> a44ac44ca00ea9b08b19fcfd234e78bf05c04e43
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
<<<<<<< HEAD
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginScreen(),
=======
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messaging App',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
>>>>>>> a44ac44ca00ea9b08b19fcfd234e78bf05c04e43
    );
  }
}
