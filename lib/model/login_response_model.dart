class LoginResponseModel {
  String token;
  String expiration;

  LoginResponseModel({
    required this.token,
    required this.expiration,
  });

  LoginResponseModel copyWith({
    String? token,
    String? expiration,
  }) {
    return LoginResponseModel(
      token: token ?? this.token,
      expiration: expiration ?? this.expiration,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expiration': expiration,
    };
  }

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'] as String,
      expiration: json['expiration'] as String,
    );
  }

  @override
  String toString() =>
      "LoginRequestModel(token: $token,expiration: $expiration)";

  @override
  int get hashCode => Object.hash(token, expiration);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseModel &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          expiration == other.expiration;
}
