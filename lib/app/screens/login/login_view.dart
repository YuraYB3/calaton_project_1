import 'package:flutter/material.dart';

import '../../theme/color_palete.dart';
import 'login_view_model.dart';
import 'widgets/email_field.dart';
import 'widgets/login_button.dart';
import 'widgets/password_field.dart';

class LoginView extends StatelessWidget {
  final ColorsPalete colorsPalete = ColorsPalete();
  final LoginViewModel model;

  LoginView({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorsPalete.backgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: colorsPalete.backgroundColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EmailField(viewModel: model),
                    PasswordField(viewModel: model),
                    LoginButton(viewModel: model),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
