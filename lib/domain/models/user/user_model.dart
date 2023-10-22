import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/data/dtos/user/user_dto.dart';

class UserModel {
  final String email;
  final String fullName;

  UserModel({
    required this.email,
    required this.fullName
  });

  static UserModel fromDTO({UserDTO? dto}) {
    return UserModel(
        email: dto?.email ?? kDefaultEmptyString,
        fullName: dto?.fullName ?? kDefaultEmptyString
    );
  }
}