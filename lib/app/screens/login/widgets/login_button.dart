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
      onPressed: () async {
        await viewModel.validateAndNavigate(
          context,
          viewModel.email,
          viewModel.password,
        );
      },
      child: Text(
        'LOGIN',
        style: TextStyle(color: colorsPalete.backgroundColor),
      ),
    ),
  );
}
