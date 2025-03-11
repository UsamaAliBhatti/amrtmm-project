// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/profile/data/models/country_model.dart';
import 'package:amrtmm_project/app/profile/data/models/gender_model.dart';
import 'package:amrtmm_project/app/profile/data/models/nationality_model.dart';
import 'package:amrtmm_project/app/profile/data/models/package_model.dart';
import 'package:amrtmm_project/app/profile/data/models/user_skills.dart';

import '../../data/models/active_package_model.dart';

class UserProfileEntity {
  final String id;
  final String ipAddress;
  final String username;
  final String email;
  final String dialCode;
  final String mobile;
  final String mobileVerified;
  final String createdOn;
  final String createdUid;
  final String active;
  final String firstName;
  final String middleName;
  final String lastName;
  final String userImage;
  final String userPhoneOtp;
  final String userDeviceToken;
  final String userDeviceType;
  final String userAccessToken;
  final String fcmToken;
  final String firebaseUserKey;
  final String tempDialCode;
  final String tempMobile;
  final String displayName;
  final String updatedOn;
  final String updatedUid;
  final String countryId;
  final String stateId;
  final String cityId;
  final String oodleToken;
  final String passwordResetCode;
  final String passwordResetTime;
  final String loginType;
  final String aboutMe;
  final String isVerifiedUser;
  final String gender;
  final String userNationality;
  final String skillsDescription;
  final String updatedAt;
  final List<dynamic> verificationImage;
  final String packageId;
  final String accountNumber;
  final String accountTitle;
  final String swiftNumber;
  final String ibanNumber;
  final String bankName;
  final String activePackageId;
  final String tempOtp;
  final String userType;
  final String roleId;
  final String skillCategoryId;
  final String reviewsCount;
  final String rattingsCount;
  final String languages;
  final String createdAt;
  final String googleProviderId;
  final String isRecurring;
  final String subscriptionId;
  final String passportImage;
  final String idImage;
  final String addressProof;
  final String driversLicense;
  final String emiratesId;
  final String uuid;
  final String isUaepassLogin;
  final String userNationalityName;
  final PackageModel package;
  final List<dynamic> ratingsReviews;
  final UserGenderModel userGender;
  final NationalityModel nationality;
  final List<UserSkillsModel> userSkills;
  final CountryModel country;
  final List<ActivePackageModel> userActivePackages;
  final ActivePackageModel currentActivePackage;
  final String role;
  final String packageName;

  const UserProfileEntity({
    required this.id,
    required this.ipAddress,
    required this.username,
    required this.email,
    required this.dialCode,
    required this.mobile,
    required this.mobileVerified,
    required this.createdOn,
    required this.createdUid,
    required this.active,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.userImage,
    required this.userPhoneOtp,
    required this.userDeviceToken,
    required this.userDeviceType,
    required this.userAccessToken,
    required this.fcmToken,
    required this.firebaseUserKey,
    required this.tempDialCode,
    required this.tempMobile,
    required this.displayName,
    required this.updatedOn,
    required this.updatedUid,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.oodleToken,
    required this.passwordResetCode,
    required this.passwordResetTime,
    required this.loginType,
    required this.aboutMe,
    required this.isVerifiedUser,
    required this.gender,
    required this.userNationality,
    required this.skillsDescription,
    required this.updatedAt,
    required this.verificationImage,
    required this.packageId,
    required this.accountNumber,
    required this.accountTitle,
    required this.swiftNumber,
    required this.ibanNumber,
    required this.bankName,
    required this.activePackageId,
    required this.tempOtp,
    required this.userType,
    required this.roleId,
    required this.skillCategoryId,
    required this.reviewsCount,
    required this.rattingsCount,
    required this.languages,
    required this.createdAt,
    required this.googleProviderId,
    required this.isRecurring,
    required this.subscriptionId,
    required this.passportImage,
    required this.idImage,
    required this.addressProof,
    required this.driversLicense,
    required this.emiratesId,
    required this.uuid,
    required this.isUaepassLogin,
    required this.userNationalityName,
    required this.package,
    required this.ratingsReviews,
    required this.userGender,
    required this.nationality,
    required this.userSkills,
    required this.country,
    required this.userActivePackages,
    required this.currentActivePackage,
    required this.role,
    required this.packageName,
  });

  UserProfileEntity copyWith({
    String? id,
    String? ipAddress,
    String? username,
    String? email,
    String? dialCode,
    String? mobile,
    String? mobileVerified,
    String? createdOn,
    String? createdUid,
    String? active,
    String? firstName,
    String? middleName,
    String? lastName,
    String? userImage,
    String? userPhoneOtp,
    String? userDeviceToken,
    String? userDeviceType,
    String? userAccessToken,
    String? fcmToken,
    String? firebaseUserKey,
    String? tempDialCode,
    String? tempMobile,
    String? displayName,
    String? updatedOn,
    String? updatedUid,
    String? countryId,
    String? stateId,
    String? cityId,
    String? oodleToken,
    String? passwordResetCode,
    String? passwordResetTime,
    String? loginType,
    String? aboutMe,
    String? isVerifiedUser,
    String? gender,
    String? userNationality,
    String? skillsDescription,
    String? updatedAt,
    List<dynamic>? verificationImage,
    String? packageId,
    String? accountNumber,
    String? accountTitle,
    String? swiftNumber,
    String? ibanNumber,
    String? bankName,
    String? activePackageId,
    String? tempOtp,
    String? userType,
    String? roleId,
    String? skillCategoryId,
    String? reviewsCount,
    String? rattingsCount,
    String? languages,
    String? createdAt,
    String? googleProviderId,
    String? isRecurring,
    String? subscriptionId,
    String? passportImage,
    String? idImage,
    String? addressProof,
    String? driversLicense,
    String? emiratesId,
    String? uuid,
    String? isUaepassLogin,
    String? userNationalityName,
    PackageModel? package,
    List<dynamic>? ratingsReviews,
    UserGenderModel? userGender,
    NationalityModel? nationality,
    List<UserSkillsModel>? userSkills,
    CountryModel? country,
    List<ActivePackageModel>? userActivePackages,
    ActivePackageModel? currentActivePackage,
    String? role,
    String? packageName,
  }) {
    return UserProfileEntity(
      id: id ?? this.id,
      ipAddress: ipAddress ?? this.ipAddress,
      username: username ?? this.username,
      email: email ?? this.email,
      dialCode: dialCode ?? this.dialCode,
      mobile: mobile ?? this.mobile,
      mobileVerified: mobileVerified ?? this.mobileVerified,
      createdOn: createdOn ?? this.createdOn,
      createdUid: createdUid ?? this.createdUid,
      active: active ?? this.active,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      userImage: userImage ?? this.userImage,
      userPhoneOtp: userPhoneOtp ?? this.userPhoneOtp,
      userDeviceToken: userDeviceToken ?? this.userDeviceToken,
      userDeviceType: userDeviceType ?? this.userDeviceType,
      userAccessToken: userAccessToken ?? this.userAccessToken,
      fcmToken: fcmToken ?? this.fcmToken,
      firebaseUserKey: firebaseUserKey ?? this.firebaseUserKey,
      tempDialCode: tempDialCode ?? this.tempDialCode,
      tempMobile: tempMobile ?? this.tempMobile,
      displayName: displayName ?? this.displayName,
      updatedOn: updatedOn ?? this.updatedOn,
      updatedUid: updatedUid ?? this.updatedUid,
      countryId: countryId ?? this.countryId,
      stateId: stateId ?? this.stateId,
      cityId: cityId ?? this.cityId,
      oodleToken: oodleToken ?? this.oodleToken,
      passwordResetCode: passwordResetCode ?? this.passwordResetCode,
      passwordResetTime: passwordResetTime ?? this.passwordResetTime,
      loginType: loginType ?? this.loginType,
      aboutMe: aboutMe ?? this.aboutMe,
      isVerifiedUser: isVerifiedUser ?? this.isVerifiedUser,
      gender: gender ?? this.gender,
      userNationality: userNationality ?? this.userNationality,
      skillsDescription: skillsDescription ?? this.skillsDescription,
      updatedAt: updatedAt ?? this.updatedAt,
      verificationImage: verificationImage ?? this.verificationImage,
      packageId: packageId ?? this.packageId,
      accountNumber: accountNumber ?? this.accountNumber,
      accountTitle: accountTitle ?? this.accountTitle,
      swiftNumber: swiftNumber ?? this.swiftNumber,
      ibanNumber: ibanNumber ?? this.ibanNumber,
      bankName: bankName ?? this.bankName,
      activePackageId: activePackageId ?? this.activePackageId,
      tempOtp: tempOtp ?? this.tempOtp,
      userType: userType ?? this.userType,
      roleId: roleId ?? this.roleId,
      skillCategoryId: skillCategoryId ?? this.skillCategoryId,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      rattingsCount: rattingsCount ?? this.rattingsCount,
      languages: languages ?? this.languages,
      createdAt: createdAt ?? this.createdAt,
      googleProviderId: googleProviderId ?? this.googleProviderId,
      isRecurring: isRecurring ?? this.isRecurring,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      passportImage: passportImage ?? this.passportImage,
      idImage: idImage ?? this.idImage,
      addressProof: addressProof ?? this.addressProof,
      driversLicense: driversLicense ?? this.driversLicense,
      emiratesId: emiratesId ?? this.emiratesId,
      uuid: uuid ?? this.uuid,
      isUaepassLogin: isUaepassLogin ?? this.isUaepassLogin,
      userNationalityName: userNationalityName ?? this.userNationalityName,
      package: package ?? this.package,
      ratingsReviews: ratingsReviews ?? this.ratingsReviews,
      userGender: userGender ?? this.userGender,
      nationality: nationality ?? this.nationality,
      userSkills: userSkills ?? this.userSkills,
      country: country ?? this.country,
      userActivePackages: userActivePackages ?? this.userActivePackages,
      currentActivePackage: currentActivePackage ?? this.currentActivePackage,
      role: role ?? this.role,
      packageName: packageName ?? this.packageName,
    );
  }
}
