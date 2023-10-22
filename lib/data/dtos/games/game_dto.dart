import 'package:jp_app_flutter/data/dtos/games/game_thumbnail_dto.dart';

class GameDTO {
  int? id;
  String? title;
  String? description;
  String? isbn;
  GameThumbnailDTO? thumbnail;

  GameDTO({
    this.id,
    this.title,
    this.description,
    this.isbn,
    this.thumbnail
  });

  static GameDTO? fromJson(Map<dynamic, dynamic>? json) {
    if(json == null) return null;
    if(json['id'] == null &&
        json['title'] == null &&
        json['description'] == null &&
        json['isbn'] == null &&
        json['thumbnail'] == null
    ) return null;
    return GameDTO(
        id:  json['id'] == null ? null : json['id'] as int,
        title: json['title'] == null ? null : json['title'] as String,
        description: json['description'] == null ? null : json['description'] as String,
        isbn: json['isbn'] == null ? null : json['isbn'] as String,
        thumbnail: GameThumbnailDTO.fromJson(json['thumbnail'])
    );
  }
}