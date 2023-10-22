import 'package:jp_app_flutter/core/constants/app_constants.dart';

/// Extension additional to use with Strings for validator
extension StringExtensions on String {

  /// Returns true if the email meets the conditions of the formatter, otherwise returns false
  bool isValidEmail() {
    RegExp regExp = RegExp(kPatternEmail);
    if(isEmpty) {
      return false;
    }
    if(!regExp.hasMatch(this)) {
      return false;
    }
    return true;
  }

  /// Returns true if the password meets the conditions of the formatter, otherwise returns false
  bool isValidPassword() {
    if(isEmpty) {
      return false;
    }
    if(length < 8) {
      return false;
    }
    return true;
  }

}