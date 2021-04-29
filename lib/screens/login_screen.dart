<<<<<<< HEAD
import 'package:edberg_messangin_app/screens/chat_room.dart';
import 'package:edberg_messangin_app/screens/home_screen.dart';
import 'package:edberg_messangin_app/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:edberg_messangin_app/database_services/authentication.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailForm = new TextEditingController();
  TextEditingController _passwordForm = new TextEditingController();
  var _formkey = GlobalKey<FormState>(); // this variable is for validation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('MESSANGING APP'),
          SizedBox(height: 15),
          Form(
            key: _formkey,
            child: Column(
              children: [
                /*--------------------------------- start Email TextField ---------------------------------------- */
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _emailForm,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                /*--------------------------------- end Password TextField ---------------------------------------- */
                SizedBox(height: 15),
                /*--------------------------------- start Password TextField ---------------------------------------- */
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _passwordForm,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                /*--------------------------------- end Password TextField ---------------------------------------- */
                SizedBox(height: 15),
                /*--------------------------------- start LOGIN BUTTON ---------------------------------------- */
                Container(
                  width: 250,
                  height: 50,
                  child: MaterialButton(
                    onPressed: () async {
                      bool shouldNavigate =
                          await login(_emailForm.text, _passwordForm.text);
                      if (shouldNavigate) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                /*--------------------------------- end LOGIN BUTTON ---------------------------------------- */
                SizedBox(height: 10),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /*--------------------------------- START Register BUTTON ---------------------------------------- */
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: Text(
                          'Register',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                )
                /*--------------------------------- END Register BUTTON ---------------------------------------- */
              ],
            ),
          ),
        ],
=======
import 'package:flutter/material.dart';
import 'package:msg_app/screens/welcomeScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.grey,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return WelcomeScreen();
                },
              ),
            );
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "email",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "password",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("Login"),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(),
                  ),
                  Text(
                    "Register now",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
>>>>>>> a44ac44ca00ea9b08b19fcfd234e78bf05c04e43
      ),
    );
  }
}
