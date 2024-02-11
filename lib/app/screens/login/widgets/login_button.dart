import 'package:flutter/material.dart';

import '../../../theme/color_palete.dart';
import '../login_view_model.dart';

class LoginButton extends StatelessWidget {
  final LoginViewModel viewModel;
  final ColorsPalete colorsPalete = ColorsPalete();

  LoginButton({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
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
}
