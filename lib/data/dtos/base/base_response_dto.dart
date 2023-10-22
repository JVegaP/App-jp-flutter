/*
class BaseResponseDTO {
  dynamic data;
  dynamic code;
  String? message;

  BaseResponseDTO({
    this.data,
    this.code,
    this.message
  });

  static BaseResponseDTO? fromJson(Map<dynamic, dynamic>? json) {
    if(json == null) return null;
    if(json['code'] == null &&
        json['data'] == null &&
        json['message'] == null
    ) return null;
    return BaseResponseDTO(
        code:  json['code'] == null ? null : json['code'] as dynamic,
        data: json['data'] == null ? null : json['data'] is Map<String, dynamic> ? BaseDataResponseDTO.fromJson(json['data']) : null,
        message: json['message'] == null ? null : json['message'] as String
    );
  }
}*/
