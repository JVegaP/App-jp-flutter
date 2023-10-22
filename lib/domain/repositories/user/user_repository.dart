import 'package:jp_app_flutter/domain/models/base/base_result_model.dart';

/// User Repository that obtain data of user
abstract class UserRepository {
  /// Method that obtain login of user
  /// [email] : email of user
  /// [password] : password of user
  Future<Result<dynamic>> login({
    required String email,
    required String password
  });
}