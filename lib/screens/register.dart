import 'package:edberg_messangin_app/database_services/authentication.dart';
import 'package:edberg_messangin_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailForm = new TextEditingController();
  TextEditingController _userNameForm = new TextEditingController();
  TextEditingController _passwordForm = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('MESSANGING APP'),
          SizedBox(
            height: 15,
          ),
          /* ---------------------------- Email -------------------------------- */
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
          SizedBox(
            height: 15,
          ),
          /* ---------------------------- user name -------------------------------- */
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              controller: _userNameForm,
              decoration: InputDecoration(
                hintText: 'User name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          /* ---------------------------- password -------------------------------- */
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
          SizedBox(
            height: 15,
          ),
          /* ----------------------------------- REGISTER BUTTON ----------------------- */
          Container(
            width: 250,
            height: 50,
            child: MaterialButton(
              onPressed: () async {
                bool shouldNavigate =
                    await register(_emailForm.text, _passwordForm.text);
                addUser(_emailForm.text, _userNameForm.text);
                if (shouldNavigate) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }
              },
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                'REGISTER',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
