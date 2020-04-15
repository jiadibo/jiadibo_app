import 'package:app/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<bool> registerUser(String email, String pass, String name) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      FirebaseUser user = result.user;

      UserUpdateInfo info = UserUpdateInfo();
      info.displayName = name;

      user.updateProfile(info);

      return true;
    } catch (e) {
      return false;
    }
  }

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
                textFormField("Fullname", _nameController, TextInputType.text,
                    false, Icons.person),
                textFormField("Email address", _emailController,
                    TextInputType.emailAddress, false, Icons.email),
                textFormField("Password", _passwordController,
                    TextInputType.visiblePassword, true, Icons.lock_outline),
                //button
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
                      if (_keyFormSignup.currentState.validate()) {
                        final email = _emailController.text.toString().trim();
                        final pass = _passwordController.text.toString().trim();
                        final name = _nameController.text.toString().trim();

                        bool result = await registerUser(email, pass, name);
                        if (result) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginForm()));
                        } else {
                          print("Gagal Register");
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
