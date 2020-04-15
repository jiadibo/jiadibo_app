import 'package:app/home/home_page.dart';
import 'package:app/login/signup_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/components/components.dart';
import 'package:flutter/painting.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _keyFormLlogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _keyFormLlogin,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 24.0, top: 80.0),
                  child: Image.asset(
                    "assets/jeeart_logo.png",
                    scale: 16,
                  ),
                ),
                textFormField("Username", _emailController,
                    TextInputType.emailAddress, false, Icons.people_outline),
                textFormField("Password", _passwordController,
                    TextInputType.visiblePassword, true, Icons.lock_outline),
                InkWell(
                  onTap: (){},
                  child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(top: 12, right: 24, bottom: 12),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.blue[800]),
                      )),
                ),
                buttonPrimary(_keyFormLlogin, Colors.blue[700], "Log in", context, HomePage()),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 36),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 24.0),
                  child: InkWell(
                    splashColor: Colors.blue,
                    onTap: (){
                      Navigator.of(context).pushNamed('/signup_form');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          " Sign up.",
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

