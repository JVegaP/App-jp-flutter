import 'package:jp_app_flutter/core/constants/network_constants.dart';
import 'package:jp_app_flutter/core/managers/call_network_manager.dart';
import 'package:jp_app_flutter/data/dtos/base/base_response_dto.dart';

class GamesApi {
  Map<String, String> headers = <String, String>{
    kContentType: kApplicationJson
  };

  /// -------------------- PUBLIC METHODS --------------------

  /// Method that obtain list of games
  /// param : [url] value string of service url
  Future<BaseResponseDTO?> getGames({required String url}) async {
    final Map<dynamic, dynamic>? response = await callGet(url: url, headers: headers);
    final BaseResponseDTO? result = BaseResponseDTO.fromJson(response);
    return result;
  }

}