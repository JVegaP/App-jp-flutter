import 'package:jp_app_flutter/core/constants/network_constants.dart';
import 'package:jp_app_flutter/core/constants/strings_constants.dart';
import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/data/datasource/cities/cities_local_data_source.dart';
import 'package:jp_app_flutter/domain/models/base/base_error_model.dart';
import 'package:jp_app_flutter/domain/models/base/base_result_model.dart';
import 'package:jp_app_flutter/domain/models/cities/response_cities_model.dart';
import 'package:jp_app_flutter/domain/repositories/cities/cities_repository.dart';

class ICitiesRepository extends CitiesRepository {
  final CitiesLocalDataSource _citiesLocalDataSource;

  ICitiesRepository({
    CitiesLocalDataSource? citiesLocalDataSource
  }): _citiesLocalDataSource = citiesLocalDataSource ?? getIt<CitiesLocalDataSource>();

  ///--------------------------------- PUBLIC METHODS ---------------------------------

  @override
  Future<Result<dynamic>> getCities() async {
    final ResponseCitiesModel? response = await _citiesLocalDataSource.getCities();
    if(response != null) {
      switch (response.code) {
        case kCodeHttpSuccess:
          return Success(data: response.data);
        default:
          return Failure<dynamic>(
              error: BaseErrorModel(
                  message: kErrorMessageCities
              )
          );
      }
    } else {
      return Failure<dynamic>(
          error: BaseErrorModel(
              message: kErrorMessageCities
          )
      );
    }
  }
}