// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchLanguagesEvent extends ProfileEvent {}

class FetchCountriesEvent extends ProfileEvent {}

class FetchNationalitiesEvent extends ProfileEvent {}

class SelectProfileImageEvent extends ProfileEvent {}

class FetchUserProfileEvent extends ProfileEvent {}

class UpdatePasswordDialogEvent extends ProfileEvent {}

class FetchProfileSkillsEvent extends ProfileEvent {}

class OpenSkillsDialogEvent extends ProfileEvent {}

class ChangeUserSkillsEvent extends ProfileEvent {
  final List<SkillEntity> selectedSkills;
  const ChangeUserSkillsEvent({
    required this.selectedSkills,
  });
}

class UpdateProfileSkillsEvent extends ProfileEvent {
  final String description;
  const UpdateProfileSkillsEvent({
    required this.description,
  });
}

class UpdatePasswordEvent extends ProfileEvent {
  final String newPassword;
  const UpdatePasswordEvent({
    required this.newPassword,
  });
}

class SelectUserNationalityEvent extends ProfileEvent {
  final NationalityEntity userNationality;
  const SelectUserNationalityEvent({
    required this.userNationality,
  });
}

class SelectUserLanguageEvent extends ProfileEvent {
  final List<LanguageEntity> userLanguages;
  const SelectUserLanguageEvent({
    required this.userLanguages,
  });
}

class SelectUserGenderEvent extends ProfileEvent {
  final int userGender;
  const SelectUserGenderEvent({
    required this.userGender,
  });
}

class UpdateUserProfileEvent extends ProfileEvent {
  final String fullName;
  final String bankName;
  final String accountNumber;
  final String iban;
  final String swiftCode;
  final String accountTitle;
  const UpdateUserProfileEvent({
    required this.fullName,
    required this.bankName,
    required this.accountNumber,
    required this.iban,
    required this.swiftCode,
    required this.accountTitle,
  });
}
