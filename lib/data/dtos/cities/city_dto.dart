class CityDTO {
  int? id;
  String? name;

  CityDTO({
    this.id,
    this.name
  });

  static CityDTO fromJson(Map<dynamic, dynamic>? json) {
    return CityDTO(
        id: json?['id'],
        name: json?['name']
    );
  }
}