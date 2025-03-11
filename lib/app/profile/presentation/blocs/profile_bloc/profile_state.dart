// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final Status status;
  final Status passUpdateStatus;
  final List<CountryEntity> countries;
  final List<LanguageEntity> languages;
  final List<NationalityEntity> nationalities;
  final UserProfileEntity? userProfile;
  final UserActivePackageEntity? currentPackage;
  final String currentPackageName;

  final NationalityEntity? selectedNationality;
  final List<LanguageEntity> selectedLanguages;
  final CountryEntity? selectedCountry;
  final Status profileLoading;
  final File? userImage;
  final int userGender;
  final List<SkillEntity> selectedSkills;
  final List<SkillEntity> skillsList;
  const ProfileState({
    this.status = Status.initial,
    this.passUpdateStatus = Status.initial,
    this.countries = const [],
    this.languages = const [],
    this.nationalities = const [],
    this.userProfile,
    this.selectedLanguages = const [],
    this.selectedCountry,
    this.profileLoading = Status.initial,
    this.userImage,
    this.selectedSkills = const [],
    this.skillsList = const [],
    this.userGender = 0,
    this.selectedNationality,
    this.currentPackage,
    this.currentPackageName = '',
  });

  @override
  List<Object?> get props => [
        status,
        languages,
        countries,
        userProfile,
        profileLoading,
        userImage,
        selectedCountry,
        selectedLanguages,
        userGender,
        passUpdateStatus,
        selectedSkills,
        skillsList,
        nationalities,
        selectedNationality,
        currentPackage,
      ];

  ProfileState copyWith({
    Status? status,
    Status? passUpdateStatus,
    List<CountryEntity>? countries,
    List<LanguageEntity>? languages,
    List<NationalityEntity>? nationalities,
    UserProfileEntity? userProfile,
    List<LanguageEntity>? selectedLanguages,
    CountryEntity? selectedCountry,
    NationalityEntity? selectedNationality,
    Status? profileLoading,
    File? userImage,
    int? userGender,
    List<SkillEntity>? selectedSkills,
    List<SkillEntity>? skillsList,
    UserActivePackageEntity? currentPackage,
    String? currentPackageName,
  }) {
    return ProfileState(
      status: status ?? this.status,
      passUpdateStatus: passUpdateStatus ?? this.passUpdateStatus,
      countries: countries ?? this.countries,
      nationalities: nationalities ?? this.nationalities,
      languages: languages ?? this.languages,
      userProfile: userProfile ?? this.userProfile,
      selectedLanguages: selectedLanguages ?? this.selectedLanguages,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      profileLoading: profileLoading ?? this.profileLoading,
      userImage: userImage ?? this.userImage,
      userGender: userGender ?? this.userGender,
      selectedSkills: selectedSkills ?? this.selectedSkills,
      skillsList: skillsList ?? this.skillsList,
      selectedNationality: selectedNationality ?? this.selectedNationality,
      currentPackage: currentPackage ?? this.currentPackage,
      currentPackageName: currentPackageName ?? this.currentPackageName,
    );
  }
}

class UpdatePasswordDialogState extends ProfileState {}

class UpdatePasswordSuccessState extends ProfileState {}

class OpenSkillDialogState extends ProfileState {}

class UpdateSkillsSuccessState extends ProfileState {}
