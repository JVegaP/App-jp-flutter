import 'package:jp_app_flutter/domain/models/base/base_result_model.dart';

/// Games Repository that obtain data of games
abstract class GamesRepository {
  /// Method that obtain list of games
  /// return : Object Future of type [Result]
  Future<Result<dynamic>> getListGames();
}