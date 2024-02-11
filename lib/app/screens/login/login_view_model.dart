import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/local_storage/ilocal_storage.dart';
import '../../common/login_variables.dart';
import '../../common/widgets/notifications_helper.dart';
import '../../routing/inavigation_util.dart';
import '../../routing/routes.dart';
import '../../services/input_validator.dart';

class LoginViewModel extends ChangeNotifier {
  final ILocalStorage _localStorage;
  final InputValidator _inputValidator = InputValidator();

  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  LoginViewModel({required ILocalStorage localStorage})
      : _localStorage = localStorage;

  void _saveEmailAndPassword() {
    _localStorage.save(loginEmail, email);
    _localStorage.save(loginPassword, password);
  }

  bool _isValidate() =>
      _inputValidator.isEmailValid(email) &&
      _inputValidator.isPasswordValid(password);

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    notifyListeners();
  }

  void onLoginButtonPressed(BuildContext context) {
    bool isValid = _isValidate();
    final INavigationUtil navigationUtil =
        Provider.of<INavigationUtil>(context, listen: false);
    if (isValid) {
      try {
        _saveEmailAndPassword();
        navigationUtil.navigateTo(routeHome, allowBackNavigation: false);
      } catch (e) {
        showNotification(context, e.toString());
      }
    } else {
      showNotification(
          context, 'Please fill in both email and password fields.');
    }
  }
}
