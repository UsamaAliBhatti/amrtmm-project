// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final Status status;
  final Status isOTPVerified;
  final Status isSkillsLoaded;
  final SignupEntity? signupModel;
  final LoginEntity? loginEntity;
  final String userOTP;
  final String errorMessage;
  final String dialCode;
  final bool isPrivacyPoilcyCheck;
  final List<SkillEntity> skillsList;
  final List<SkillEntity> selectedSkills;
  final Status isSignedUp;
  const AuthState({
    this.status = Status.initial,
    this.isOTPVerified = Status.initial,
    this.isSignedUp = Status.initial,
    this.isSkillsLoaded = Status.initial,
    this.signupModel,
    this.userOTP = "",
    this.errorMessage = "",
    this.dialCode = "",
    this.skillsList = const [],
    this.isPrivacyPoilcyCheck = false,
    this.selectedSkills = const [],
    this.loginEntity,
  });

  @override
  List<Object?> get props {
    return [
      status,
      isSignedUp,
      isOTPVerified,
      isSkillsLoaded,
      signupModel,
      userOTP,
      errorMessage,
      dialCode,
      skillsList,
      isPrivacyPoilcyCheck,
      selectedSkills,
      loginEntity
    ];
  }

  AuthState copyWith({
    Status? status,
    Status? isOTPVerified,
    Status? isSkillsLoaded,
    Status? isSignedUp,
    SignupEntity? signupModel,
    LoginEntity? loginEntity,
    String? userOTP,
    String? errorMessage,
    String? dialCode,
    bool? isPrivacyPoilcyCheck,
    List<SkillEntity>? skillsList,
    List<SkillEntity>? selectedSkills,
  }) {
    return AuthState(
      status: status ?? this.status,
      isOTPVerified: isOTPVerified ?? this.isOTPVerified,
      isSkillsLoaded: isSkillsLoaded ?? this.isSkillsLoaded,
      isSignedUp: isSignedUp ?? this.isSignedUp,
      signupModel: signupModel ?? this.signupModel,
      userOTP: userOTP ?? this.userOTP,
      errorMessage: errorMessage ?? this.errorMessage,
      dialCode: dialCode ?? this.dialCode,
      isPrivacyPoilcyCheck: isPrivacyPoilcyCheck ?? this.isPrivacyPoilcyCheck,
      skillsList: skillsList ?? this.skillsList,
      selectedSkills: selectedSkills ?? this.selectedSkills,
      loginEntity: loginEntity ?? this.loginEntity,
    );
  }
}

class LoginSuccessState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final String otp;
  const RegisterSuccessState({
    required this.otp,
  });
}

class OTPSuccessState extends AuthState {}
