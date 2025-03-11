import 'package:amrtmm_project/app/auth/domain/entities/signup_enitity.dart';

class SignupModel {
  final bool status;
  final String message;
  final String accessToken;
  final int otp;

  SignupModel({
    required this.status,
    required this.message,
    required this.accessToken,
    required this.otp,
  });

  // JSON -> Model
  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      status: json['status'],
      message: json['message'],
      accessToken: json['accessToken'],
      otp: json['otp'],
    );
  }

  // Model -> JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'accessToken': accessToken,
      'otp': otp,
    };
  }

  // Model -> Entity
  SignupEntity toEntity() {
    return SignupEntity(
      id: '', // Add ID mapping logic if available
      name: '', // Add name mapping logic if available
      accessToken: accessToken,
      otp: otp,
    );
  }

  // Entity -> Model (Optional)
  factory SignupModel.fromEntity(SignupEntity user) {
    return SignupModel(
      status: true,
      message: 'Converted from entity',
      accessToken: user.accessToken,
      otp: user.otp,
    );
  }
}
