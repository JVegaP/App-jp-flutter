import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/data/dtos/games/game_dto.dart';
import 'package:jp_app_flutter/domain/models/games/game_thumbnail_model.dart';

class GameModel {
  final int id;
  final String title;
  final String description;
  final String isbn;
  final GameThumbnailModel? thumbnail;

  GameModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isbn,
    this.thumbnail
  });

  static GameModel fromDTO({GameDTO? dto}) {
    return GameModel(
        id: dto?.id ?? kDefaultInitInt,
        title: dto?.title ?? kDefaultEmptyString,
        description: dto?.description ?? kDefaultEmptyString,
        isbn: dto?.isbn ?? kDefaultEmptyString,
        thumbnail: GameThumbnailModel.fromDTO(dto: dto?.thumbnail)
    );
  }
}