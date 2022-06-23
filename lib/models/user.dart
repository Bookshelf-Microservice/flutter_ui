class User {
  // final String userId;
  final String username;
  final String email;

  User({
    required this.username,
    // required this.userId,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      // userId: json['userId'] as String,
      username: json['username'],
      email: json['email'],
    );
  }
}
