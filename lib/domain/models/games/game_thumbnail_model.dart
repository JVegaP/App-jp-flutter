import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/data/dtos/games/game_thumbnail_dto.dart';

class GameThumbnailModel {
  final String path;
  final String extension;

  GameThumbnailModel({
    required this.path,
    required this.extension
  });

  static GameThumbnailModel fromDTO({GameThumbnailDTO? dto}) {
    return GameThumbnailModel(
        path: dto?.path ?? kDefaultEmptyString,
        extension: dto?.extension ?? kDefaultEmptyString
    );
  }
}