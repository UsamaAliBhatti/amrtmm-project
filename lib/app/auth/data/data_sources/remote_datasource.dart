// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:amrtmm_project/app/auth/data/models/login_model.dart';
import 'package:amrtmm_project/app/auth/domain/entities/login_entity.dart';
import 'package:amrtmm_project/app/auth/domain/entities/otp_entity.dart';
import 'package:amrtmm_project/app/auth/domain/entities/signup_enitity.dart';
import 'package:amrtmm_project/core/constants/api_constants.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/res/api_response.dart';
import '../models/otp_model.dart';
import '../models/signup_model.dart';

abstract class AuthRemoteDatasource {
  Future<ApiResponse<SignupEntity>> registerUser(
      Map<String, dynamic> userDetails);
  Future<ApiResponse<OtpEntity>> verifyOTP(Map<String, dynamic> otpData);
  Future<ApiResponse<LoginEntity>> login(Map<String, dynamic> loginData);
}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  Dio dio;
  AuthRemoteDatasourceImpl({
    required this.dio,
  });
  @override
  Future<ApiResponse<SignupEntity>> registerUser(
      Map<String, dynamic> userDetails) async {
    try {
      log("CALLED THIS METHOD ${userDetails.toString()}");
      final data = FormData.fromMap(userDetails);
      final response = await dio.post(APIConst.registerUser, data: data);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: SignupModel.fromJson(response.data).toEntity(),
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response!.realUri.toString());
      log("ENTERING HERE");
      return ApiResponse(
        status: false,
        message:
            e.response?.data["message"] ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<OtpEntity>> verifyOTP(Map<String, dynamic> otpData) async {
    try {
      // final data = FormData.fromMap(otpData);
      final response = await dio.post(APIConst.verifyOTP, data: otpData);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: OtpModel.fromJson(response.data),
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response!.realUri.toString());
      log(e.response!.data.toString());
      log("ENTERING HERE");
      return ApiResponse(
        status: false,
        message:
            e.response?.data["message"] ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<LoginEntity>> login(Map<String, dynamic> loginData) async {
    try {
      final response = await dio.post(APIConst.loginUser, data: loginData);
      log(response.statusCode.toString(), name: "LOGIN");
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: LoginModel.fromJson(response.data).toEntity(),
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response!.realUri.toString());
      log("ENTERING LOGIN API CATCH");
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }
}
