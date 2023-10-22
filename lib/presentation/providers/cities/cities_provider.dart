import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/core/constants/strings_constants.dart';
import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/domain/models/base/base_result_model.dart';
import 'package:jp_app_flutter/domain/models/cities/city_model.dart';
import 'package:jp_app_flutter/domain/use_cases/cities/get_cities_use_case.dart';

class CitiesProvider with ChangeNotifier {
  final GetCitiesUseCase _getCitiesUseCase;

  CitiesProvider({
    GetCitiesUseCase? getCitiesUseCase
  }): _getCitiesUseCase = getCitiesUseCase ?? getIt<GetCitiesUseCase>();

  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  String _errorMessage = kDefaultEmptyString;
  String get errorMessage {
    return _errorMessage;
  }
  set errorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  List<CityModel> _cities = <CityModel>[];
  List<CityModel> get cities {
    return _cities;
  }
  set cities(List<CityModel> cities){
    _cities = cities;
    notifyListeners();
  }

  set selected(int index) {
    for (var element in _cities) { element.selected = false; }
    _cities[index].selected = true;
    notifyListeners();
  }

  bool _isSelect = false;
  bool get isSelect {
    return _isSelect;
  }
  set isSelect(bool isSelect) {
    _isSelect = isSelect;
    notifyListeners();
  }

  /// Method that list cities
  Future<List<CityModel>> getCities() async {
    var response = await _getCitiesUseCase.invoke();
    if(response is Failure) {
      errorMessage = response.error.message ?? kDefaultEmptyString;
      return <CityModel>[];
    }
    if(response is Success) {
      return response.data;
    }
    errorMessage = kErrorMessageCities;
    return <CityModel>[];
  }

}