import 'package:jp_app_flutter/data/dtos/user/user_dto.dart';

class ResponseUserDTO {
  dynamic data;
  dynamic code;
  String? message;

  ResponseUserDTO({
    this.data,
    this.code,
    this.message
  });

  static ResponseUserDTO? fromJson(Map<dynamic, dynamic>? json) {
    if(json == null) return null;
    if(json['code'] == null &&
        json['data'] == null &&
        json['message'] == null
    ) return null;
    return ResponseUserDTO(
        code:  json['code'] == null ? null : json['code'] as dynamic,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => UserDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] == null ? null : json['message'] as String
    );
  }

  ResponseUserDTO copyWith({
    dynamic data,
    dynamic code,
    String? message
  }) => ResponseUserDTO(
      data: data ?? this.data,
      code: code ?? this.code,
      message: message ?? this.message
  );

}