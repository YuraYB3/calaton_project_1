import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/user/user.dart';
import '../../../domain/local_storage/ilocal_storage.dart';
import '../../../domain/user/iuser.dart';
import '../../common/widgets/notifications_helper.dart';
import '../../routing/inavigation_util.dart';
import '../../routing/routes.dart';
import '../../services/input_validator.dart';
import '../../services/local_storage/keys/keys.dart';

class LoginViewModel extends ChangeNotifier {
  final ILocalStorage _localStorage;
  final InputValidator _inputValidator = InputValidator();
  final IUser _userModel = User(email: '', password: '');

  String get email => _userModel.email;
  String get password => _userModel.password;

  LoginViewModel({required ILocalStorage localStorage})
      : _localStorage = localStorage;

  void _saveEmailAndPassword() {
    _localStorage.save(keyEmail, email);
    _localStorage.save(keyPassword, password);
  }

  bool _isValidate() =>
      _inputValidator.isEmailValid(email) &&
      _inputValidator.isPasswordValid(password);

  void updateEmail(String value) {
    _userModel.email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _userModel.password = value;
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
