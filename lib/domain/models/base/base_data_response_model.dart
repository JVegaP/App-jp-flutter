import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/data/dtos/base/base_data_response_dto.dart';
import 'package:jp_app_flutter/domain/models/games/game_model.dart';

class BaseDataResponseModel {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<GameModel> results;

  BaseDataResponseModel({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results
  });

  static BaseDataResponseModel fromDTO({required BaseDataResponseDTO dto}) {
    return BaseDataResponseModel(
        offset: dto.offset ?? kDefaultInitInt,
        limit: dto.limit ?? kDefaultInitInt,
        total: dto.total ?? kDefaultInitInt,
        count: dto.count ?? kDefaultInitInt,
        results: List<GameModel>.from(dto.results!.map((element) => GameModel.fromDTO(dto: element))).toList()
    );
  }
}