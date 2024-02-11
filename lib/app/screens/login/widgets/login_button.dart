import 'package:flutter/material.dart';

import '../../../theme/color_palete.dart';
import '../login_view_model.dart';

SizedBox loginButton(
    LoginViewModel viewModel, BuildContext context, ColorsPalete colorsPalete) {
  return SizedBox(
    width: 250,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () {
        viewModel.onLoginButtonPressed(
          context,
        );
      },
      child: Text(
        'LOGIN',
        style: TextStyle(color: colorsPalete.backgroundColor),
      ),
    ),
  );
}
