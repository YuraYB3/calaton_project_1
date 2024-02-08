import 'package:flutter/material.dart';
import 'package:project_1/app/routing/routes.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/notifications_helper.dart';
import '../../routing/inavigation_util.dart';
import '../../services/local_storage/local_storage.dart';
import '../../services/input_validator.dart';

class LoginViewModel extends ChangeNotifier {
  final LocalStorage _localStorage = LocalStorage();
  final InputValidator _inputValidator = InputValidator();

  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  LoginViewModel() {
    _init();
  }

  Future<void> _init() async {
    await _localStorage.initPrefs();
  }

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<void> validateAndNavigate(
      BuildContext context, String email, String password) async {
    if (_inputValidator.isEmailValid(email) &&
        _inputValidator.isPasswordValid(password)) {
      try {
        await _localStorage.saveUserData(email, password);
        final INavigationUtil _navigationUtil =
            Provider.of<INavigationUtil>(context, listen: false);
        _navigationUtil.navigateTo(routeHome, allowBackNavigation: false);
      } catch (e) {
        showNotification(context, e.toString());
      }
    } else {
      showNotification(
          context, 'Please fill in both email and password fields.');
    }
  }
}
