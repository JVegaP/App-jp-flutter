import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/constants/style_constants.dart';
import 'package:jp_app_flutter/presentation/screens/cities/cities_screen.dart';
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

  /// go to Cities Screen
  openCitiesScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      opaque: true,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const CitiesScreen();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(kDimens1, kDimens0);
        const end = Offset(kDimens0, kDimens0);
        const curve = Curves.easeIn;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }

  /// go to Games Screen
  openGamesScreen(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      opaque: true,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const CitiesScreen();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(kDimens1, kDimens0);
        const end = Offset(kDimens0, kDimens0);
        const curve = Curves.easeIn;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }
}