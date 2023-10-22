class UserDTO {
  String? fullName;
  String? email;
  String? password;

  UserDTO({
    this.fullName,
    this.email,
    this.password
  });

  static UserDTO fromJson(Map<dynamic, dynamic>? json) {
    return UserDTO(
      fullName: json?['full_name'],
      email: json?['email'],
      password: json?['password']
    );
  }
}