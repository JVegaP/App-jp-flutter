import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:jp_app_flutter/data/dtos/cities/response_cities_dto.dart';

class CitiesApi {
  String url;
  CitiesApi({
    required this.url
  });

  /// -------------------- PUBLIC METHODS --------------------
  Future<ResponseCitiesDTO?> getCities() {
    return rootBundle.loadStructuredData<ResponseCitiesDTO?>(url, (String value) async {
      return ResponseCitiesDTO.fromJson(json.decode(value));
    });
  }
}