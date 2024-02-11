import 'package:flutter/material.dart';

import '../login_view_model.dart';

class EmailField extends StatelessWidget {
  final LoginViewModel viewModel;

  const EmailField({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
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
}
