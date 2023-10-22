import 'package:jp_app_flutter/core/constants/network_constants.dart';
import 'package:jp_app_flutter/data/api/games_api.dart';
import 'package:jp_app_flutter/data/dtos/base/base_response_dto.dart';
import 'package:jp_app_flutter/domain/models/base/base_response_model.dart';

/// Games Remote Data Source that obtain list data games
abstract class GamesRemoteDataSource {
  /// Method that obtain list of games
  /// return : Future of type [BaseResponseModel] with response of service
  Future<BaseResponseModel?> getListGames({String? title});
}

class IGamesRemoteDataSource extends GamesRemoteDataSource {
  final GamesApi _gamesApi;

  IGamesRemoteDataSource({
    GamesApi? gamesApi
  }): _gamesApi = gamesApi ?? GamesApi();

  /// -------------------- PUBLIC METHODS --------------------
  @override
  Future<BaseResponseModel?> getListGames({String? title}) async {
    final BaseResponseDTO? response = await _gamesApi.getGames(url: '$kUrlBase$kUrlBaseAuthorization');
    if(response!=null) {
      return BaseResponseModel.fromDTO(dto: response);
    }
    return null;
  }

}