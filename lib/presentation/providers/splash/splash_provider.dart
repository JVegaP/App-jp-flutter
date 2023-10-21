import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/constants/app_constants.dart';

class SplashProvider with ChangeNotifier {

  double _opacityText = kWithoutOpacity;
  double get opacityText {
    return _opacityText;
  }
  set opacityText(double opacityText) {
    _opacityText = opacityText;
    notifyListeners();
  }

  double _opacityAnimation = kWithOpacity;
  double get opacityAnimation {
    return _opacityAnimation;
  }
  set opacityAnimation(double opacityAnimation) {
    _opacityAnimation = opacityAnimation;
    notifyListeners();
  }

}