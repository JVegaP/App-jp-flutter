import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/domain/models/base/base_result_model.dart';
import 'package:jp_app_flutter/domain/repositories/games/games_repository.dart';

/// Use case that obtain list of games
abstract class GetGamesUseCase {
  /// Method that return list of games or any exception
  /// return : Object of type [Result] with list of data or exception
  Future<Result<dynamic>> invoke();
}

class IGetGamesUseCase extends GetGamesUseCase {
  final GamesRepository _gamesRepository;

  IGetGamesUseCase({
    GamesRepository? gamesRepository
  }): _gamesRepository = gamesRepository ?? getIt<GamesRepository>();

  @override
  Future<Result<dynamic>> invoke() async {
    final Result<dynamic> result = await _gamesRepository.getListGames();
    return result;
  }
}