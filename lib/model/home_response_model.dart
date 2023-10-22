class HomeResponseModel {
  List<User>? data;
  bool? success;
  String? message;

  HomeResponseModel({
    this.data,
    this.success,
    this.message,
  });

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

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'success': success,
      'message': message,
    };
  }

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );
  }

  @override
  String toString() =>
      "HomeResponseModel(data: $data,success: $success,message: $message)";

  @override
  int get hashCode => Object.hash(data, success, message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeResponseModel &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          success == other.success &&
          message == other.message;
}

class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );
  }

  @override
  String toString() =>
      "Data(id: $id,email: $email,firstName: $firstName,lastName: $lastName)";

  @override
  int get hashCode => Object.hash(id, email, firstName, lastName);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          firstName == other.firstName &&
          lastName == other.lastName;
}
