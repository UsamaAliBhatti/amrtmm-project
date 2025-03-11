// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/auth/domain/entities/login_entity.dart';
import 'package:amrtmm_project/app/auth/domain/entities/signup_enitity.dart';
import 'package:amrtmm_project/app/auth/domain/repositories/auth_repository.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';
import 'package:amrtmm_project/core/utils/res/usecase.dart';

import '../entities/otp_entity.dart';

class RegisterUserUC
    implements UseCase<ApiResponse<SignupEntity>, Map<String, dynamic>> {
  AuthRepository repo;
  RegisterUserUC({
    required this.repo,
  });

  @override
  Future<ApiResponse<SignupEntity>> call({Map<String, dynamic>? params}) {
    return repo.registerUser(params ?? {});
  }
}

class VerifyOTPUC
    implements UseCase<ApiResponse<OtpEntity>, Map<String, dynamic>> {
  AuthRepository repo;

  VerifyOTPUC({required this.repo});

  @override
  Future<ApiResponse<OtpEntity>> call({Map<String, dynamic>? params}) {
    return repo.verifyOTP(params ?? {});
  }
}

class LoginUseCase
    implements UseCase<ApiResponse<LoginEntity>, Map<String, dynamic>> {
  AuthRepository repo;

  LoginUseCase({required this.repo});

  @override
  Future<ApiResponse<LoginEntity>> call({Map<String, dynamic>? params}) {
    return repo.loginUser(params ?? {});
  }
}
