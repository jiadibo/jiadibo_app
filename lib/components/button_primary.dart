import 'package:flutter/material.dart';
import 'package:app/home/home_page.dart';

Widget buttonPrimary(
    GlobalKey<FormState> key, Color color, String title, BuildContext context, Widget widget) {
  return Container(
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
      onPressed: () {
        if (key.currentState.validate()) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => widget));
        }
      },
      color: color,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  );
}
