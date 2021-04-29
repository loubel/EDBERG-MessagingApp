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
      ),
    );
  }
}
