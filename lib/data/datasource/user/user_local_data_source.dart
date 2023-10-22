import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/data/api/user_api.dart';
import 'package:jp_app_flutter/data/dtos/user/response_user_dto.dart';
import 'package:jp_app_flutter/data/dtos/user/user_dto.dart';
import 'package:jp_app_flutter/domain/models/user/response_user_model.dart';

/// User Local Data Source that obtain data of user
abstract class UserLocalDataSource {
  /// Method that login of user
  /// [email] : email of user
  /// [password] : password of user
  Future<ResponseUserModel?> login({
    required String email,
    required String password
  });
}

/// Implementation User Local Data Source that obtain data of user
class IUserLocalDataSource extends UserLocalDataSource {
  final UserApi _userApi;

  IUserLocalDataSource({
    UserApi? userApi
  }): _userApi = userApi ?? getIt<UserApi>();

  @override
  Future<ResponseUserModel?> login({
    required String email,
    required String password
  }) async {
    final ResponseUserDTO? response = await _userApi.login();
    if(response != null) {
      List<UserDTO> dataFinal = [];
      final index = response.data.indexWhere((element) =>
          (element.email == email && element.password == password));
      if (index < 0) return null;
      dataFinal.add(response.data[index]);
      final responseCopy = response.copyWith();
      responseCopy.data = dataFinal;
      return ResponseUserModel.fromDTO(dto: responseCopy);
    }
    return null;
  }
}