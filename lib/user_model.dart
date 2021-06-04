class User {
  final String firstname;
  final String lastname;
  final String emailUsername;
  final String password;
  final String role;

  User({
    this.firstname,
    this.lastname,
    this.emailUsername,
    this.password,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      emailUsername: json['emailUsername'] as String,   
      password: json['password'] as String,
      role: json['role'] as String,
    );
  }
}