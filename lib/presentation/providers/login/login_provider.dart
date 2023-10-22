import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/domain/models/base/base_result_model.dart';
import 'package:jp_app_flutter/domain/use_cases/login/login_user_use_case.dart';

class LoginProvider with ChangeNotifier {
  final LoginUserUseCase _loginUserUseCase;

  LoginProvider({
    LoginUserUseCase? loginUserUseCase
  }): _loginUserUseCase = loginUserUseCase ?? getIt<LoginUserUseCase>();

  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool _showPassword = false;
  bool get showPassword {
    return _showPassword;
  }
  set showPassword(bool showPassword) {
    _showPassword = showPassword;
    notifyListeners();
  }

  bool _emailValid = false;
  bool get emailValid {
    return _emailValid;
  }
  set emailValid(bool emailValid) {
    _emailValid = emailValid;
    notifyListeners();
  }

  bool _passwordValid = false;
  bool get passwordValid {
    return _passwordValid;
  }
  set passwordValid(bool passwordValid) {
    _passwordValid = passwordValid;
    notifyListeners();
  }

  String _errorMessage = kDefaultEmptyString;
  String get errorMessage {
    return _errorMessage;
  }
  set errorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  /// Method that login of user
  /// [email] : email of user
  /// [password] : password of user
  Future<bool> login({
    required String email,
    required String password
  }) async {
    var response = await _loginUserUseCase.invoke(
        email: email,
        password: password
    );
    final bool isLogged = response is Success;
    if(response is Failure) {
      errorMessage = response.error.message ?? kDefaultEmptyString;
      return false;
    }
    return isLogged;
  }

}