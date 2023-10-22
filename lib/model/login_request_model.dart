class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  LoginRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  @override
  String toString() => "LoginRequestModel(email: $email,password: $password)";

  @override
  int get hashCode => Object.hash(email, password);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginRequestModel &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          password == other.password;
}
