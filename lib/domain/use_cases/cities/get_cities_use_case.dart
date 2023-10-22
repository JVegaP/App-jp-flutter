import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/domain/models/base/base_result_model.dart';
import 'package:jp_app_flutter/domain/repositories/cities/cities_repository.dart';

/// Use case that obtain list of cities
abstract class GetCitiesUseCase {
  Future<Result<dynamic>> invoke();
}

class IGetCitiesUseCase extends GetCitiesUseCase {
  final CitiesRepository _citiesRepository;

  IGetCitiesUseCase({
    CitiesRepository? citiesRepository
  }): _citiesRepository = citiesRepository ?? getIt<CitiesRepository>();

  @override
  Future<Result<dynamic>> invoke() async {
    final Result<dynamic> result = await _citiesRepository.getCities();
    return result;
  }
}