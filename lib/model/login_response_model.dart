import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
@immutable
final class LoginResponseModel {
  final String? token;
  final String? expiration;

  const LoginResponseModel({
    this.token,
    this.expiration,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  LoginResponseModel copyWith({
    String? token,
    String? expiration,
  }) {
    return LoginResponseModel(
      token: token ?? this.token,
      expiration: expiration ?? this.expiration,
    );
  }
}
