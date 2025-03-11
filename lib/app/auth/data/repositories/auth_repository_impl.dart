// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:amrtmm_project/app/auth/data/data_sources/remote_datasource.dart';
import 'package:amrtmm_project/app/auth/domain/entities/login_entity.dart';
import 'package:amrtmm_project/app/auth/domain/entities/otp_entity.dart';
import 'package:amrtmm_project/app/auth/domain/repositories/auth_repository.dart';
import 'package:amrtmm_project/core/network/network_info.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

import '../../domain/entities/signup_enitity.dart';

class AuthRepositoryImpl implements AuthRepository {
  NetworkInfoImpl networkInfo;
  AuthRemoteDatasourceImpl auth;
  AuthRepositoryImpl({
    required this.networkInfo,
    required this.auth,
  });
  @override
  Future<ApiResponse<SignupEntity>> registerUser(
      Map<String, dynamic> userData) async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await auth.registerUser(userData);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<OtpEntity>> verifyOTP(Map<String, dynamic> otpData) async {
    try {
      final isConnected = await networkInfo.isConnected();
      log(isConnected.toString());
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await auth.verifyOTP(otpData);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<LoginEntity>> loginUser(
      Map<String, dynamic> loginData) async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }
      log(loginData.toString());

      return await auth.login(loginData);
    } catch (e) {
      log(e.toString());
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }
}
