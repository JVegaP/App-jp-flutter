class GameThumbnailDTO {
  String? path;
  String? extension;

  GameThumbnailDTO({
    this.path,
    this.extension
  });

  static GameThumbnailDTO? fromJson(Map<dynamic, dynamic>? json) {
    if(json == null) return null;
    return GameThumbnailDTO(
        path:  json['path'] == null ? null : json['path'] as String,
        extension: json['extension'] == null ? null : json['extension'] as String
    );
  }
}