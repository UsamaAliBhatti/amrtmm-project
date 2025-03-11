// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:amrtmm_project/app/profile/domain/entities/active_package_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/country_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/language_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/nationality_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/user_profile_entity.dart';
import 'package:amrtmm_project/app/profile/domain/usecases/profile_usecases.dart';
import 'package:amrtmm_project/app/service/domain/entities/skill_entity.dart';
import 'package:amrtmm_project/app/service/domain/usecases/service_usecases.dart';
import 'package:amrtmm_project/core/services/databases/local_db.dart';
import 'package:amrtmm_project/core/services/keys/db_keys.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/enums/status.dart';
import '../../../../../core/utils/functions/app_functions.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  LanguageUsecase languageUsecase;
  CountryUsecase countryUsecase;
  FetchUserProfileUsecase fetchUserProfileUsecase;
  UpdateUserPasswordUserCase updatePasswordUC;
  FetchSkillsUC skillsUC;
  UpdateUserSkillsUserCase updateSkillsUC;
  NationalityUsecase nationalityUsecase;
  UpdateUserProfileUserCase updateProfileUC;

  ProfileBloc(
      {required this.languageUsecase,
      required this.countryUsecase,
      required this.fetchUserProfileUsecase,
      required this.updatePasswordUC,
      required this.skillsUC,
      required this.updateSkillsUC,
      required this.nationalityUsecase,
      required this.updateProfileUC})
      : super(const ProfileState()) {
    on<FetchCountriesEvent>(_onFetchCountries);
    on<FetchLanguagesEvent>(_onFetchLanguages);
    on<FetchNationalitiesEvent>(_onFetchNationalities);
    on<FetchUserProfileEvent>(_onFetchUserProfile);
    on<SelectProfileImageEvent>(_onSelectProfileImage);
    on<SelectUserGenderEvent>(_onSelectUserGender);
    on<UpdatePasswordDialogEvent>(_onUpdatePasswordDialogEvent);
    on<UpdatePasswordEvent>(_onUpdatePasswordEvent);
    on<FetchProfileSkillsEvent>(_onFetchSkillsEvent);
    on<ChangeUserSkillsEvent>(_onChangeUserSkills);
    on<UpdateProfileSkillsEvent>(_onUpdateProfileSkills);
    on<OpenSkillsDialogEvent>(_onOpenSkillDialog);
    on<SelectUserNationalityEvent>(_onSelectUserNationality);
    on<SelectUserLanguageEvent>(_onSelectUserLanguage);
    on<UpdateUserProfileEvent>(_onUpdateUserProfile);
  }

  _onUpdateUserProfile(
      UpdateUserProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(profileLoading: Status.loading));
    final selectedLanguageIds =
        state.selectedLanguages.map((lang) => lang.id).join(',');
    final data = {
      'name': event.fullName,
      'gender': state.userGender,
      'bank_name': event.bankName,
      'account_number': event.accountNumber,
      'account_title': event.accountTitle,
      'swift_number': event.swiftCode,
      'iban_number': event.iban,
      'languages': selectedLanguageIds,
      'user_nationality': state.selectedNationality?.id,
      'file': state.userImage,
    };
    final response = await updateProfileUC.call(params: data);
    if (response.status) {
      add(FetchUserProfileEvent());
      showToast(msg: "Profile Updated Successfully");
      return;
    }
    showToast(msg: response.message);
    emit(state.copyWith(profileLoading: Status.error));
  }

  _onSelectUserNationality(
      SelectUserNationalityEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(selectedNationality: event.userNationality));
  }

  _onSelectUserLanguage(
      SelectUserLanguageEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(selectedLanguages: event.userLanguages));
  }

  _onOpenSkillDialog(OpenSkillsDialogEvent event, Emitter<ProfileState> emit) {
    final oldState = state;
    emit(OpenSkillDialogState());
    emit(oldState);
  }

  _onUpdateProfileSkills(
      UpdateProfileSkillsEvent event, Emitter<ProfileState> emit) async {
    if (state.selectedSkills.isEmpty) {
      showToast(msg: "Select atleast one skill");
      return;
    }
    String skillIds =
        state.selectedSkills.map((skill) => skill.id.toString()).join(',');
    final data = {'skills': skillIds, 'describe_skills': event.description};

    final resp = await updateSkillsUC.call(params: data);
    if (resp.status) {
      final oldState = state;
      emit(UpdateSkillsSuccessState());
      emit(oldState);
      return;
    }
    showToast(msg: "Error: ${resp.message}");
    // emit(const Update);
  }

  _onChangeUserSkills(ChangeUserSkillsEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(selectedSkills: []));
    emit(state.copyWith(selectedSkills: event.selectedSkills));
  }

  _onFetchSkillsEvent(
      FetchProfileSkillsEvent event, Emitter<ProfileState> emit) async {
    final response = await skillsUC.call();
    if (response.status) {
      emit(state.copyWith(skillsList: response.data));
      return;
    }
  }

  _onUpdatePasswordEvent(
      UpdatePasswordEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(passUpdateStatus: Status.loading));
    final data = await updatePasswordUC.call(params: event.newPassword);
    if (data.status) {
      final oldState = state;
      emit(UpdatePasswordSuccessState());
      emit(oldState);
      emit(state.copyWith(passUpdateStatus: Status.success));
      return;
    }
    emit(state.copyWith(passUpdateStatus: Status.error));
  }

  _onUpdatePasswordDialogEvent(
      UpdatePasswordDialogEvent event, Emitter<ProfileState> emit) {
    final oldState = state;
    emit(UpdatePasswordDialogState());
    emit(oldState);
  }

  _onSelectUserGender(SelectUserGenderEvent event, Emitter<ProfileState> emit) {
    log(event.userGender.toString());
    emit(state.copyWith(userGender: event.userGender));
  }

  _onSelectProfileImage(
      SelectProfileImageEvent event, Emitter<ProfileState> emit) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      final file = File(image.path);
      emit(state.copyWith(userImage: file));
      return;
    }
  }

  _onFetchCountries(
      FetchCountriesEvent event, Emitter<ProfileState> emit) async {
    emit(const ProfileState(status: Status.loading));
    final result = await countryUsecase.call();
    if (result.status) {
      emit(state.copyWith(
        status: Status.success,
        countries: result.data,
      ));
      return;
    }
    emit(state.copyWith(
      status: Status.error,
    ));
    return null;
  }

  _onFetchLanguages(
      FetchLanguagesEvent event, Emitter<ProfileState> emit) async {
    emit(const ProfileState(status: Status.loading));
    final result = await languageUsecase.call();
    if (result.status) {
      emit(state.copyWith(
        status: Status.success,
        languages: result.data,
      ));
      return;
    }
    emit(state.copyWith(
      status: Status.error,
    ));
  }

  _onFetchNationalities(
      FetchNationalitiesEvent event, Emitter<ProfileState> emit) async {
    emit(const ProfileState(status: Status.loading));
    final result = await nationalityUsecase.call();
    if (result.status) {
      emit(state.copyWith(
        status: Status.success,
        nationalities: result.data,
      ));
      return;
    }
    emit(state.copyWith(
      status: Status.error,
    ));
  }

  _onFetchUserProfile(
      FetchUserProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(profileLoading: Status.loading));
    final accessToken = LocalDB.getString(DBKeys.accessToken);
    final data = await fetchUserProfileUsecase.call(params: accessToken);
    if (data.status) {
      final userGender = data.data?.gender ?? '0';

      final selectedNationality = data.data?.nationality;
      List<int> selectedLanguageIds;
      if (data.data?.languages.isNotEmpty ?? false) {
        selectedLanguageIds =
            data.data!.languages.split(',').map((e) => int.parse(e)).toList();
      } else {
        selectedLanguageIds = [];
      }

      List<LanguageEntity> selectedLanguages = state.languages
          .where((lang) => selectedLanguageIds.contains(lang.id))
          .toList();

      final selectedSkills =
          data.data?.userSkills.map((skills) => skills.skill).toList();
      // log(selectedSkills?.length.toString() ?? "");

      emit(
        state.copyWith(
            profileLoading: Status.success,
            userProfile: data.data,
            userGender: int.parse(userGender),
            selectedSkills: List.from(
              selectedSkills ?? [],
            ),
            selectedNationality: selectedNationality,
            selectedLanguages: selectedLanguages,
            currentPackage: data.data?.currentActivePackage,
            currentPackageName: data.data?.packageName ?? "Basic Package"),
      );
      return;
    }
    emit(state.copyWith(profileLoading: Status.error));
    log("MESSAGE ====> ${data.message}", name: "FETCH PROFILE EVENT ERROR");
  }
}
