import 'package:flutter/material.dart';

import '../login_view_model.dart';

SizedBox passwordField(LoginViewModel viewModel) {
  return SizedBox(
      width: 250,
      child: TextField(
        obscureText: true,
        onChanged: (value) => viewModel.updatePassword(value),
        decoration: const InputDecoration(
            labelText: 'Password',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.amberAccent),
            ),
            labelStyle: TextStyle(
              color: Colors.amberAccent,
            )),
      ));
}
