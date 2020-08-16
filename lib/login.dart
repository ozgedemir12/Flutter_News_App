import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:news_app1/views/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (input) {
              if (input.isEmpty) {
                return 'Lütfen bir email giriniz.';
              }
            },
            decoration: InputDecoration(
                labelText: 'Email',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                hintText: 'Email giriniz'),
            onSaved: (input) => _email = input,
          ),
          TextFormField(
            validator: (input) {
              if (input.length < 6) {
                return 'Lütfen 6 haneli şifre giriniz.';
              }
            },
            decoration: InputDecoration(
                labelText: 'Password',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                hintText: 'Şifre'),
            onSaved: (input) => _password = input,
            obscureText: true,
          ),
          RaisedButton(
            elevation: 5.0,
            onPressed: signIn,
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            color: Colors.white,
            child: Text(
              'Giriş Yap',
              style: TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
