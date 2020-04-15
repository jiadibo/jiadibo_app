import 'package:app/home/home_page.dart';
import 'package:app/login/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:app/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginForm(),
      routes: <String, WidgetBuilder>{
        '/home_page': (BuildContext context) => HomePage(),
        '/login_form': (BuildContext context) => LoginForm(),
        '/signup_form': (BuildContext context) => SignupForm(),
      },
    );
  }
}
