import 'package:jp_app_flutter/data/dtos/cities/city_dto.dart';

class ResponseCitiesDTO {
  dynamic data;
  dynamic code;
  String? message;

  ResponseCitiesDTO({
    this.data,
    this.code,
    this.message
  });

  static ResponseCitiesDTO? fromJson(Map<dynamic, dynamic>? json) {
    if(json == null) return null;
    if(json['code'] == null &&
        json['data'] == null &&
        json['message'] == null
    ) return null;
    return ResponseCitiesDTO(
        code:  json['code'] == null ? null : json['code'] as dynamic,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => CityDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] == null ? null : json['message'] as String
    );
  }

  ResponseCitiesDTO copyWith({
    dynamic data,
    dynamic code,
    String? message
  }) => ResponseCitiesDTO(
      data: data ?? this.data,
      code: code ?? this.code,
      message: message ?? this.message
  );

}