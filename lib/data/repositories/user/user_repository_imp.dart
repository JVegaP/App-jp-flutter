import 'package:jp_app_flutter/core/constants/network_constants.dart';
import 'package:jp_app_flutter/core/constants/strings_constants.dart';
import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/data/datasource/user/user_local_data_source.dart';
import 'package:jp_app_flutter/domain/models/base/base_error_model.dart';
import 'package:jp_app_flutter/domain/models/base/base_result_model.dart';
import 'package:jp_app_flutter/domain/models/user/response_user_model.dart';
import 'package:jp_app_flutter/domain/repositories/user/user_repository.dart';

class IUserRepository extends UserRepository {
  final UserLocalDataSource _userLocalDataSource;

  IUserRepository({
    UserLocalDataSource? userLocalDataSource
  }): _userLocalDataSource = userLocalDataSource ?? getIt<UserLocalDataSource>();

  ///--------------------------------- PUBLIC METHODS ---------------------------------

  @override
  Future<Result<dynamic>> login({required String email, required String password}) async {
    final ResponseUserModel? response = await _userLocalDataSource.login(email: email, password: password);
    if(response != null) {
      switch (response.code) {
        case kCodeHttpSuccess:
          return Success(data: response.data);
        default:
          return Failure<dynamic>(
              error: BaseErrorModel(
                  message: kErrorMessageLogin
              )
          );
      }
    } else {
      return Failure<dynamic>(
        error: BaseErrorModel(
          message: kErrorMessageLogin
        )
      );
    }
  }
}