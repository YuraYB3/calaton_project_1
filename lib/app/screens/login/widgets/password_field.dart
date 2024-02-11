import 'package:flutter/material.dart';

import '../login_view_model.dart';

class PasswordField extends StatelessWidget {
  final LoginViewModel viewModel;

  const PasswordField({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
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
}
