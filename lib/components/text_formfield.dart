import 'package:flutter/material.dart';

Widget textFormField(String label, TextEditingController controller,
    TextInputType typeKeyboard, bool obscuretext, IconData icon) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(1, 4),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscuretext,
          validator: (value) {
            if (value.isEmpty) {
              return "$label must not be empty";
            } else if (value.length < 6) {
              return "we can't find an account. try another username or email";
            } else {
              return null;
            }
          },
          cursorColor: Colors.blue[700],
          textInputAction: TextInputAction.next,
          keyboardType: typeKeyboard,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.blue[700]),
            labelText: label,
            filled: true,
            fillColor: Colors.white,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.blue[700]),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            labelStyle: TextStyle(
              color: Colors.blue[700],
            ),
          ),
        ),
      ),
    ),
  );
}