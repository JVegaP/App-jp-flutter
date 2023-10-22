import 'package:jp_app_flutter/domain/models/base/base_result_model.dart';

/// Cities Repository that obtain data of cities
abstract class CitiesRepository {
  /// Method that obtain list of cities
  Future<Result<dynamic>> getCities();
}