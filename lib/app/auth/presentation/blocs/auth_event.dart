// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends AuthEvent {
  final String name;
  final String email;
  final String dialCode;
  final String phone;
  final String password;
  final String skills;
  final String aboutMe;
  const RegisterUserEvent({
    required this.name,
    required this.email,
    required this.dialCode,
    required this.phone,
    required this.password,
    required this.skills,
    required this.aboutMe,
  });
}

class LoginEvent extends AuthEvent {
  final Map<String, dynamic> loginData;
  const LoginEvent({
    required this.loginData,
  });
}

class SelectCountryCodeEvent extends AuthEvent {
  final String countryCode;
  const SelectCountryCodeEvent({required this.countryCode});
}

class CheckPrivacyPolicyEvent extends AuthEvent {}

class FetchSkillsEvent extends AuthEvent {}

class VerifyOTPEvent extends AuthEvent {
  final String accessToken;
  final String otp;
  const VerifyOTPEvent({
    required this.accessToken,
    required this.otp,
  });
}

class UpdateSelectedSkillsEvent extends AuthEvent {
  final List<SkillEntity> selectedSkills;
  const UpdateSelectedSkillsEvent({
    required this.selectedSkills,
  });
}
