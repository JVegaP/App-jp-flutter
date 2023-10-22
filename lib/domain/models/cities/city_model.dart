import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/data/dtos/cities/city_dto.dart';

class CityModel {
  final int id;
  final String name;
  bool selected = false;

  CityModel({
    required this.id,
    required this.name
  });

  static CityModel fromDTO({CityDTO? dto}) {
    return CityModel(
        id: dto?.id ?? kDefaultInitInt,
        name: dto?.name ?? kDefaultEmptyString
    );
  }
}