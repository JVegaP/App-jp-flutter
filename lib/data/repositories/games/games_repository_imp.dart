import 'package:jp_app_flutter/core/constants/network_constants.dart';
import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/data/datasource/games/games_remote_data_source.dart';
import 'package:jp_app_flutter/domain/models/base/base_error_model.dart';
import 'package:jp_app_flutter/domain/models/base/base_response_model.dart';
import 'package:jp_app_flutter/domain/models/base/base_result_model.dart';
import 'package:jp_app_flutter/domain/repositories/games/games_repository.dart';

class IGamesRepository extends GamesRepository {
  final GamesRemoteDataSource _gamesRemoteDataSource;

  IGamesRepository({
    GamesRemoteDataSource? gamesRemoteDataSource
  }): _gamesRemoteDataSource = gamesRemoteDataSource ?? getIt<GamesRemoteDataSource>();

  ///--------------------------------- PUBLIC METHODS ---------------------------------
  @override
  Future<Result<dynamic>> getListGames() async {
    final BaseResponseModel? response = await _gamesRemoteDataSource.getListGames();
    if(response != null) {
      switch (response.statusCode) {
        case kCodeHttpSuccess:
          return Success(data: response.data);
        default:
          return Failure<dynamic>(
              error: BaseErrorModel(
                  message: response.message
              )
          );
      }
    } else {
      return Failure<dynamic>(
          error: BaseErrorModel(
              message: response?.message
          )
      );
    }
  }
}