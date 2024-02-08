import 'package:flutter/material.dart';
import 'package:project_1/app/routing/routes.dart';

import '../../../domain/local_storage/ilocal_storage.dart';
import '../../common/widgets/notifications_helper.dart';
import '../../routing/inavigation_util.dart';
import '../../services/local_storage/local_storage.dart';
import '../../services/input_validator.dart';

class LoginViewModel extends ChangeNotifier {
  final ILocalStorage _localStorage = LocalStorage();
  final InputValidator _inputValidator = InputValidator();
  final INavigationUtil navigationUtil;
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  LoginViewModel({required this.navigationUtil});

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
        await _localStorage.save(email, password);
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
