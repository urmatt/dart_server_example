class User{
  User(
    this.name,
    this.username,
    this.password,
  );

  String name;

  String username;

  String password;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['name'],
      json['username'],
      json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'password': password,
    };
  }
}
