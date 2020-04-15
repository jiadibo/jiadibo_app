import 'package:app/home/home_page.dart';
import 'package:app/login/signup_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<FirebaseUser> loginFirebase(String email, String pass) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: pass);
      FirebaseUser user = result.user;

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
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
                  onTap: () {},
                  child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(top: 12, right: 24, bottom: 12),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.blue[800]),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.blue[700].withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(left: 24, right: 24, top: 8),
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    onPressed: () async {
                      if (_keyFormLlogin.currentState.validate()) {
                        final email = _emailController.text.toString().trim();
                        final pass = _passwordController.text.toString().trim();

                        FirebaseUser user = await loginFirebase(email, pass);

                        if (user != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage(name: user.displayName)));
                        } else {
                          print("Error, Gagal Login");
                        }
                      }
                    },
                    color: Colors.blue[700],
                    child: Text(
                      "Sing up",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 36),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 24.0),
                  child: InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
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

