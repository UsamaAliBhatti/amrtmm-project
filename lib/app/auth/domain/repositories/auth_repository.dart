import 'package:amrtmm_project/app/auth/domain/entities/login_entity.dart';
import 'package:amrtmm_project/app/auth/domain/entities/otp_entity.dart';
import 'package:amrtmm_project/app/auth/domain/entities/signup_enitity.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

abstract class AuthRepository {
  Future<ApiResponse<SignupEntity>> registerUser(Map<String, dynamic> userData);
  Future<ApiResponse<OtpEntity>> verifyOTP(Map<String, dynamic> otpData);
  Future<ApiResponse<LoginEntity>> loginUser(Map<String, dynamic> loginData);
}
