import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/domain/models/base/base_result_model.dart';
import 'package:jp_app_flutter/domain/repositories/user/user_repository.dart';

/// Use case that login user
abstract class LoginUserUseCase {
  Future<Result<dynamic>> invoke({
    required String email,
    required String password
  });
}
class ILoginUserUseCase extends LoginUserUseCase {
  final UserRepository _userRepository;

  ILoginUserUseCase({
    UserRepository? userRepository
  }): _userRepository = userRepository ?? getIt<UserRepository>();

  @override
  Future<Result<dynamic>> invoke({
    required String email,
    required String password
  }) async {
    final Result<dynamic> result = await _userRepository.login(email: email, password: password);
    return result;
  }
}