class User {
  final int? id;
  final String? name;
  final String? email;
  final String? username;

  User({
    this.id,
    this.name,
    this.email,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      username: json['username']);

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "email": email, 'username': username};
}
