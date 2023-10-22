import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/constants/style_constants.dart';
import 'package:jp_app_flutter/presentation/screens/login/login_screen.dart';

final route = RoutesManager();
class RoutesManager {
  /// go to Login Screen
  openLoginScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      opaque: true,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const LoginScreen();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = kDimens0;
        var end = kDimens1;
        var curve = Curves.easeIn;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    ));
  }
}