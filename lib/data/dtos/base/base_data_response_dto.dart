import 'package:jp_app_flutter/data/dtos/games/game_dto.dart';

class BaseDataResponseDTO {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<GameDTO?>? results;

  BaseDataResponseDTO({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results
  });

  static BaseDataResponseDTO? fromJson(Map<dynamic, dynamic>? json) {
    if(json == null) return null;
    return BaseDataResponseDTO(
      offset:  json['offset'] == null ? null : json['offset'] as int,
      limit:  json['limit'] == null ? null : json['limit'] as int,
      total:  json['total'] == null ? null : json['total'] as int,
      count:  json['count'] == null ? null : json['count'] as int,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => GameDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}