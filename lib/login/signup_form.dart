import 'package:app/login/login.dart';
import 'package:flutter/material.dart';
import 'package:app/components/components.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _keyFormSignup = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _keyFormSignup,
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
                textFormField("Fullname", _nameController,
                    TextInputType.text, false, Icons.person),
                textFormField("Email address", _emailController,
                    TextInputType.emailAddress, false, Icons.email),
                textFormField("Phone number", _phoneController,
                    TextInputType.phone, false, Icons.phone),
                textFormField("Password", _passwordController,
                    TextInputType.visiblePassword, true, Icons.lock_outline),
                buttonPrimary(_keyFormSignup, Colors.blue[700], "Sign up", context, LoginForm()),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 36),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 24.0),
                  child: InkWell(
                    splashColor: Colors.blue,
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          " Sign in.",
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
