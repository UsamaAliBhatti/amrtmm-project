import '../../domain/entities/otp_entity.dart';

class OtpModel extends OtpEntity {
  OtpModel({
    required bool status,
    required String message,
    required String accessToken,
  }) : super(
          status: status,
          message: message,
          accessToken: accessToken,
        );

  // Factory method to create a model from JSON
  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      accessToken: json['accessToken'] as String,
    );
  }

  // Method to convert a model to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'accessToken': accessToken,
    };
  }
}
