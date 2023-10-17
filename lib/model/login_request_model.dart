class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel(this.email, this.password);

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(json["email"], "password");
  }

  Map<String, dynamic> toMap() {
    return {"email": email, "password": password};
  }
}
