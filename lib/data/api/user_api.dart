import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:jp_app_flutter/data/dtos/user/response_user_dto.dart';

class UserApi {
  String url;
  UserApi({
    required this.url
  });

  /// -------------------- PUBLIC METHODS --------------------
  Future<ResponseUserDTO?> login() {
    return rootBundle.loadStructuredData<ResponseUserDTO?>(url, (String value) async {
      return ResponseUserDTO.fromJson(json.decode(value));
    });
  }
}