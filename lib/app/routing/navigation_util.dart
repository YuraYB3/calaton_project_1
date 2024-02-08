import 'package:flutter/material.dart';

import 'inavigation_util.dart';

class NavigationUtil implements INavigationUtil {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<dynamic> navigateTo<T extends Object?>(
    String routeName, {
    bool allowBackNavigation = true,
    dynamic data,
  }) {
    if (allowBackNavigation) {
      return navigatorKey.currentState!.pushNamed(routeName, arguments: data);
    } else {
      return navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: data);
    }
  }

  @override
  Future<dynamic> navigateToAndMakeRoot<T extends Object?>(
    String routeName, {
    bool allowBackNavigation = true,
    dynamic data,
  }) {
    if (allowBackNavigation) {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: data,
      );
    } else {
      return navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: data);
    }
  }

  @override
  Future<dynamic> navigateToAndReplace<T extends Object?>(
    String routeName, {
    dynamic data,
  }) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: data);
  }

  @override
  void navigateBack({dynamic data}) {
    navigatorKey.currentState!.pop(data);
  }

  @override
  void navigateBackUntilNamed(String named) {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(named));
  }

  @override
  bool get canPop => navigatorKey.currentState!.canPop();

  @override
  void navigateBackToStart() {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
