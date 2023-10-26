import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
part 'home_response_model.g.dart';

@JsonSerializable()
@immutable
final class HomeResponseModel {
  final List<User>? data;
  final bool? success;
  final String? message;

  const HomeResponseModel({
    this.data,
    this.success,
    this.message,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseModelToJson(this);

  HomeResponseModel copyWith({
    List<User>? data,
    bool? success,
    String? message,
  }) {
    return HomeResponseModel(
      data: data ?? this.data,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }
}

@JsonSerializable()
@immutable
final class User {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;

  const User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }
}
