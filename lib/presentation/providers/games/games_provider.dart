import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/domain/models/base/base_result_model.dart';
import 'package:jp_app_flutter/domain/models/games/game_model.dart';
import 'package:jp_app_flutter/domain/use_cases/games/get_games_use_case.dart';

class GamesProvider with ChangeNotifier {
  final GetGamesUseCase _getGamesUseCase;

  GamesProvider({
    GetGamesUseCase? getGamesUseCase
  }): _getGamesUseCase = getGamesUseCase ?? getIt<GetGamesUseCase>();


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

  List<GameModel> _games = <GameModel>[];
  List<GameModel> get games {
    return _games;
  }
  set games(List<GameModel> games){
    _games = games;
    notifyListeners();
  }

  /// Method that list of games
  /// return : Future of type List [GameModel] with list of games
  Future<List<GameModel>> getGames() async {
    var response = await _getGamesUseCase.invoke();
    if(response is Success) {
      return response.data.results;
    }
    if(response is Failure) {
      errorMessage = response.error.message ?? kDefaultEmptyString;
      return [];
    }
    return [];
  }
}