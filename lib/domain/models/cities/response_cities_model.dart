import 'package:jp_app_flutter/data/dtos/cities/response_cities_dto.dart';
import 'package:jp_app_flutter/domain/models/cities/city_model.dart';

class ResponseCitiesModel {
  dynamic code;
  dynamic data;
  String? message;

  ResponseCitiesModel({
    this.code,
    this.data,
    this.message
  });

  static ResponseCitiesModel fromDTO({required ResponseCitiesDTO dto}) {
    return ResponseCitiesModel(
        code: dto.code,
        data: List<CityModel>.from(dto.data!.map((element) => CityModel.fromDTO(dto: element))).toList(),
        message: dto.message
    );
  }
}