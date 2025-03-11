// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io' show Platform;

import 'package:amrtmm_project/app/auth/domain/entities/login_entity.dart';
import 'package:amrtmm_project/app/auth/domain/usecases/auth_usecases.dart';
import 'package:amrtmm_project/app/service/domain/entities/skill_entity.dart';
import 'package:amrtmm_project/app/service/domain/usecases/service_usecases.dart';
import 'package:amrtmm_project/core/enums/status.dart';
import 'package:amrtmm_project/core/utils/functions/app_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/services/databases/local_db.dart';
import '../../domain/entities/signup_enitity.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  RegisterUserUC registerUserUC;
  FetchSkillsUC skillsUC;
  VerifyOTPUC otpUC;
  LoginUseCase loginUC;
  AuthBloc({
    required this.registerUserUC,
    required this.skillsUC,
    required this.otpUC,
    required this.loginUC,
  }) : super(const AuthState()) {
    on<SelectCountryCodeEvent>(_onSelectCountryCode);
    on<RegisterUserEvent>(_onRegisterUser);
    on<CheckPrivacyPolicyEvent>(_onPrivacyPolicyCheck);
    on<FetchSkillsEvent>(_onSkillsFetch);
    on<UpdateSelectedSkillsEvent>(_onSelectSkills);
    on<VerifyOTPEvent>(_onOTPVerification);
    on<LoginEvent>(_onLoginEvent);
  }

  _onOTPVerification(
    VerifyOTPEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isOTPVerified: Status.loading));
    log(event.accessToken, name: "ACCESS TOKEN VERIFICATION OTP AUTH BLOC");
    final otpData = {"access_token": event.accessToken, "otp": event.otp};

    final result = await otpUC.call(params: otpData);
    if (result.status) {
      emit(state.copyWith(isOTPVerified: Status.success));
      final isSaved = await LocalDB.saveUserConfiguration(
          accessToken: result.data?.accessToken ?? "", isLoggedIn: true);
      if (isSaved) {
        final prevState = state;
        emit(OTPSuccessState());
        emit(prevState);
      } else {
        showToast(msg: "Error while verifying otp");
        emit(state.copyWith(
          status: Status.error,
        ));
      }
    }
    emit(state.copyWith(isOTPVerified: Status.error));
  }

  _onSelectSkills(UpdateSelectedSkillsEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(selectedSkills: event.selectedSkills));
  }

  _onSkillsFetch(FetchSkillsEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isSkillsLoaded: Status.loading));
    final result = await skillsUC.call();
    if (result.status) {
      log(result.data.toString());
      emit(state.copyWith(
          isSkillsLoaded: Status.success, skillsList: result.data));
      return;
    }
    emit(state.copyWith(isSkillsLoaded: Status.error));
    return null;
  }

  _onSelectCountryCode(SelectCountryCodeEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(dialCode: event.countryCode));
  }

  _onPrivacyPolicyCheck(
      CheckPrivacyPolicyEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isPrivacyPoilcyCheck: !state.isPrivacyPoilcyCheck));
  }

  _onRegisterUser(RegisterUserEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isSignedUp: Status.loading));

    final skills = state.selectedSkills;

    final stringSkill = skills.map((skill) => skill.id.toString()).join(",");
    final userData = {
      "user_name": event.name,
      "email": event.email,
      "dial_code": event.dialCode,
      "mobile": event.phone,
      "password": event.password,
      "password_confirmation": event.password,
      "skills": stringSkill,
      "about_me": event.aboutMe,
      "user_device_token": "testing token",
      "user_device_type": Platform.isAndroid ? "android" : "ios",
    };

    final result = await registerUserUC.call(params: userData);
    if (result.status) log(result.data?.otp.toString() ?? "");
    showToast(
        msg: "Your OTP code is: ${result.data?.otp}",
        toastLength: Toast.LENGTH_LONG);
    if (result.status) {
      emit(
          state.copyWith(isSignedUp: Status.success, signupModel: result.data));
      final prevState = state;
      emit(RegisterSuccessState(otp: result.data?.otp.toString() ?? "123456"));
      emit(prevState);
      return;
    }
    emit(state.copyWith(
      isSignedUp: Status.error,
    ));

    return null;
  }

  _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await loginUC.call(params: event.loginData);
    if (result.status) {
      emit(state.copyWith(status: Status.success, loginEntity: result.data));
      final isSaved = await LocalDB.saveUserConfiguration(
          accessToken: result.data?.accessToken ?? "", isLoggedIn: true);
      if (!isSaved) {
        showToast(msg: "Error while saving data");
        emit(state.copyWith(
          status: Status.error,
        ));
        return;
      }
      final prevState = state;
      emit(LoginSuccessState());
      emit(prevState);
      return;
    }
    emit(state.copyWith(status: Status.error, errorMessage: result.message));
  }
}
