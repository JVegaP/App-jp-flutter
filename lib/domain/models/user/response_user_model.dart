import 'package:jp_app_flutter/data/dtos/user/response_user_dto.dart';
import 'package:jp_app_flutter/domain/models/user/user_model.dart';

class ResponseUserModel {
  dynamic code;
  dynamic data;
  String? message;

  ResponseUserModel({
    this.code,
    this.data,
    this.message
  });

  static ResponseUserModel fromDTO({required ResponseUserDTO dto}) {
    return ResponseUserModel(
        code: dto.code,
        data: List<UserModel>.from(dto.data!.map((element) => UserModel.fromDTO(dto: element))).toList(),
        message: dto.message
    );
  }
}