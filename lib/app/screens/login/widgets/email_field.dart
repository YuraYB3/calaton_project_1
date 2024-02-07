import 'package:flutter/material.dart';

import '../login_view_model.dart';

SizedBox emailField(LoginViewModel viewModel) {
  return SizedBox(
    width: 250,
    child: TextField(
      onChanged: (value) => viewModel.updateEmail(value),
      decoration: const InputDecoration(
          labelText: 'Email',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amberAccent),
          ),
          labelStyle: TextStyle(
            color: Colors.amberAccent,
          )),
    ),
  );
}
