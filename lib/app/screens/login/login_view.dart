import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/color_palete.dart';
import 'login_view_model.dart';
import 'widgets/email_field.dart';
import 'widgets/login_button.dart';
import 'widgets/password_fiel.dart';

class LoginView extends StatelessWidget {
  final ColorsPalete colorsPalete = ColorsPalete();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginViewModel viewModel =
        Provider.of<LoginViewModel>(context, listen: true);

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
                    emailField(viewModel),
                    passwordField(viewModel),
                    loginButton(viewModel, context, colorsPalete),
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
