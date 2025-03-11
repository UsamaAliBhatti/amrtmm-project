import '../../domain/entities/login_entity.dart';

class LoginModel {
  final bool status;
  final String message;
  final String accessToken;
  final dynamic oData;

  LoginModel({
    required this.status,
    required this.message,
    required this.accessToken,
    this.oData,
  });

  // Factory method to deserialize JSON into the model
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      accessToken: json['accessToken'] ?? '',
      oData: json['oData'], // Could be null
    );
  }

  // Method to map model to entity
  LoginEntity toEntity() {
    return LoginEntity(
      status: status,
      message: message,
      accessToken: accessToken,
      oData: oData,
    );
  }
}
