import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/data/api/cities_api.dart';
import 'package:jp_app_flutter/data/dtos/cities/response_cities_dto.dart';
import 'package:jp_app_flutter/domain/models/cities/response_cities_model.dart';

/// Cities Local Data Source that obtain list data cities
abstract class CitiesLocalDataSource {
  /// Method that obtain list cities
  Future<ResponseCitiesModel?> getCities();
}

/// Implementation Cities Local Data Source that obtain list data cities
class ICitiesLocalDataSource extends CitiesLocalDataSource {
  final CitiesApi _citiesApi;

  ICitiesLocalDataSource({
    CitiesApi? citiesApi
  }): _citiesApi = citiesApi ?? getIt<CitiesApi>();

  @override
  Future<ResponseCitiesModel?> getCities() async {
    final ResponseCitiesDTO? response = await _citiesApi.getCities();
    if(response != null) {
      return ResponseCitiesModel.fromDTO(dto: response);
    }
    return null;
  }
}