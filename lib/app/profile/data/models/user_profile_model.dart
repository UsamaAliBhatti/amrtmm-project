// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amrtmm_project/app/profile/data/models/country_model.dart';
import 'package:amrtmm_project/app/profile/data/models/gender_model.dart';
import 'package:amrtmm_project/app/profile/data/models/nationality_model.dart';
import 'package:amrtmm_project/app/profile/data/models/package_model.dart';
import 'package:amrtmm_project/app/profile/data/models/user_skills.dart';
import 'package:amrtmm_project/app/profile/domain/entities/user_profile_entity.dart';
import 'package:amrtmm_project/core/utils/functions/app_functions.dart';

import 'active_package_model.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required String id,
    required String ipAddress,
    required String username,
    required String email,
    required String dialCode,
    required String mobile,
    required String mobileVerified,
    required DateTime createdOn,
    required String createdUid,
    required String active,
    required String firstName,
    required String middleName,
    required String lastName,
    required String userImage,
    required String userPhoneOtp,
    required String userDeviceToken,
    required String userDeviceType,
    required String userAccessToken,
    required String fcmToken,
    required String firebaseUserKey,
    required String tempDialCode,
    required String tempMobile,
    required String displayName,
    required DateTime updatedOn,
    required String updatedUid,
    required String countryId,
    required String stateId,
    required String cityId,
    required String oodleToken,
    required String passwordResetCode,
    required String passwordResetTime,
    required String loginType,
    required String aboutMe,
    required String isVerifiedUser,
    required String gender,
    required String userNationality,
    required String skillsDescription,
    required DateTime updatedAt,
    required List<dynamic> verificationImage,
    required String packageId,
    required String accountNumber,
    required String accountTitle,
    required String swiftNumber,
    required String ibanNumber,
    required String bankName,
    required String activePackageId,
    required String tempOtp,
    required String userType,
    required String roleId,
    required String skillCategoryId,
    required String reviewsCount,
    required String rattingsCount,
    required String languages,
    required DateTime createdAt,
    required String googleProviderId,
    required String isRecurring,
    required String subscriptionId,
    required String passportImage,
    required String idImage,
    required String addressProof,
    required String driversLicense,
    required String emiratesId,
    required String uuid,
    required String isUaepassLogin,
    required String userNationalityName,
    required PackageModel package,
    required List<dynamic> ratingsReviews,
    required UserGenderModel userGender,
    required NationalityModel nationality,
    required List<UserSkillsModel> userSkills,
    required CountryModel country,
    required List<ActivePackageModel> userActivePackages,
    required ActivePackageModel currentActivePackage,
    required String role,
    required String packageName,
  }) : super(
            id: id,
            ipAddress: ipAddress,
            username: username,
            email: email,
            dialCode: dialCode,
            mobile: mobile,
            mobileVerified: mobileVerified,
            createdOn: createdOn.toIso8601String(),
            createdUid: createdUid,
            active: active,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            userImage: userImage,
            userPhoneOtp: userPhoneOtp,
            userDeviceToken: userDeviceToken,
            userDeviceType: userDeviceType,
            userAccessToken: userAccessToken,
            fcmToken: fcmToken,
            firebaseUserKey: firebaseUserKey,
            tempDialCode: tempDialCode,
            tempMobile: tempMobile,
            displayName: displayName,
            updatedOn: updatedOn.toIso8601String(),
            updatedUid: updatedUid,
            countryId: countryId,
            stateId: stateId,
            cityId: cityId,
            oodleToken: oodleToken,
            passwordResetCode: passwordResetCode,
            passwordResetTime: passwordResetCode,
            loginType: loginType,
            aboutMe: aboutMe,
            isVerifiedUser: isVerifiedUser,
            gender: gender,
            userNationality: userNationality,
            skillsDescription: skillsDescription,
            updatedAt: updatedAt.toIso8601String(),
            verificationImage: verificationImage,
            packageId: packageId,
            accountNumber: accountNumber,
            accountTitle: accountTitle,
            swiftNumber: swiftNumber,
            ibanNumber: ibanNumber,
            bankName: bankName,
            activePackageId: activePackageId,
            tempOtp: tempOtp,
            userType: userType,
            roleId: roleId,
            skillCategoryId: skillCategoryId,
            reviewsCount: reviewsCount,
            rattingsCount: rattingsCount,
            languages: languages,
            createdAt: createdAt.toIso8601String(),
            googleProviderId: googleProviderId,
            isRecurring: isRecurring,
            subscriptionId: subscriptionId,
            passportImage: passportImage,
            idImage: idImage,
            addressProof: addressProof,
            driversLicense: driversLicense,
            emiratesId: emiratesId,
            uuid: uuid,
            isUaepassLogin: isUaepassLogin,
            userNationalityName: userNationalityName,
            package: package,
            ratingsReviews: ratingsReviews,
            userGender: userGender,
            nationality: nationality,
            userSkills: userSkills,
            country: country,
            userActivePackages: userActivePackages,
            currentActivePackage: currentActivePackage,
            role: role,
            packageName: packageName);

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json["id"],
        ipAddress: json["ip_address"],
        username: json["username"],
        email: json["email"],
        dialCode: json["dial_code"],
        mobile: json["mobile"],
        mobileVerified: json["mobile_verified"],
        createdOn: DateTime.parse(json["created_on"]),
        createdUid: json["created_uid"],
        active: json["active"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        userImage: json["user_image"],
        userPhoneOtp: json["user_phone_otp"],
        userDeviceToken: json["user_device_token"],
        userDeviceType: json["user_device_type"],
        userAccessToken: json["user_access_token"],
        fcmToken: json["fcm_token"],
        firebaseUserKey: json["firebase_user_key"],
        tempDialCode: json["temp_dial_code"],
        tempMobile: json["temp_mobile"],
        displayName: json["display_name"],
        updatedOn: parseDate(json["updated_on"]) ?? DateTime.now(),
        updatedUid: json["updated_uid"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        oodleToken: json["oodle_token"],
        passwordResetCode: json["password_reset_code"],
        passwordResetTime: json["password_reset_time"],
        loginType: json["login_type"],
        aboutMe: json["about_me"],
        isVerifiedUser: json["is_verified_user"],
        gender: json["gender"],
        userNationality: json["user_nationality"],
        skillsDescription: json["skills_description"],
        updatedAt: DateTime.parse(json["updated_at"]),
        verificationImage:
            List<dynamic>.from(json["verification_image"].map((x) => x)),
        packageId: json["package_id"],
        accountNumber: json["account_number"],
        accountTitle: json["account_title"],
        swiftNumber: json["swift_number"],
        ibanNumber: json["iban_number"],
        bankName: json["bank_name"],
        activePackageId: json["active_package_id"],
        tempOtp: json["temp_otp"],
        userType: json["user_type"],
        roleId: json["role_id"],
        skillCategoryId: json["skill_category_id"],
        reviewsCount: json["reviews_count"],
        rattingsCount: json["rattings_count"],
        languages: json["languages"],
        createdAt: DateTime.parse(json["created_at"]),
        googleProviderId: json["google_provider_id"],
        isRecurring: json["is_recurring"],
        subscriptionId: json["subscription_id"],
        passportImage: json["passport_image"],
        idImage: json["id_image"],
        addressProof: json["address_proof"],
        driversLicense: json["drivers_license"],
        emiratesId: json["emirates_id"],
        uuid: json["uuid"],
        isUaepassLogin: json["is_uaepass_login"],
        userNationalityName: json["user_nationality_name"],
        package: PackageModel.fromJson(json["package"]),
        ratingsReviews:
            List<dynamic>.from(json["ratings_reviews"].map((x) => x)),
        userGender: UserGenderModel.fromJson(json["user_gender"]),
        nationality: NationalityModel.fromJson(
            json["nationality"] == "" ? {} : json["nationality"]),
        userSkills: List<UserSkillsModel>.from(
            json["user_skills"].map((x) => UserSkillsModel.fromJson(x))),
        country: CountryModel.fromJson(json["country"]),
        userActivePackages: List<ActivePackageModel>.from(
            json["user_active_packages"]
                .map((x) => ActivePackageModel.fromJson(x))),
        currentActivePackage:
            ActivePackageModel.fromJson(json["current_active_package"]),
        role: json["role"],
        packageName: json["package_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ip_address": ipAddress,
        "username": username,
        "email": email,
        "dial_code": dialCode,
        "mobile": mobile,
        "mobile_verified": mobileVerified,
        "created_on": createdOn,
        "created_uid": createdUid,
        "active": active,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "user_image": userImage,
        "user_phone_otp": userPhoneOtp,
        "user_device_token": userDeviceToken,
        "user_device_type": userDeviceType,
        "user_access_token": userAccessToken,
        "fcm_token": fcmToken,
        "firebase_user_key": firebaseUserKey,
        "temp_dial_code": tempDialCode,
        "temp_mobile": tempMobile,
        "display_name": displayName,
        "updated_on": updatedOn,
        "updated_uid": updatedUid,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "oodle_token": oodleToken,
        "password_reset_code": passwordResetCode,
        "password_reset_time": passwordResetTime,
        "login_type": loginType,
        "about_me": aboutMe,
        "is_verified_user": isVerifiedUser,
        "gender": gender,
        "user_nationality": userNationality,
        "skills_description": skillsDescription,
        "updated_at": updatedAt,
        "verification_image":
            List<dynamic>.from(verificationImage.map((x) => x)),
        "package_id": packageId,
        "account_number": accountNumber,
        "account_title": accountTitle,
        "swift_number": swiftNumber,
        "iban_number": ibanNumber,
        "bank_name": bankName,
        "active_package_id": activePackageId,
        "temp_otp": tempOtp,
        "user_type": userType,
        "role_id": roleId,
        "skill_category_id": skillCategoryId,
        "reviews_count": reviewsCount,
        "rattings_count": rattingsCount,
        "languages": languages,
        "created_at": createdAt,
        "google_provider_id": googleProviderId,
        "is_recurring": isRecurring,
        "subscription_id": subscriptionId,
        "passport_image": passportImage,
        "id_image": idImage,
        "address_proof": addressProof,
        "drivers_license": driversLicense,
        "emirates_id": emiratesId,
        "uuid": uuid,
        "is_uaepass_login": isUaepassLogin,
        "user_nationality_name": userNationalityName,
        "package": package.toJson(),
        "ratings_reviews": List<dynamic>.from(ratingsReviews.map((x) => x)),
        "user_gender": userGender.toJson(),
        "nationality": nationality.toJson(),
        "user_skills": List<dynamic>.from(userSkills.map((x) => x.toJson())),
        "country": country.toJson(),
        "user_active_packages":
            List<dynamic>.from(userActivePackages.map((x) => x.toJson())),
        "current_active_package": currentActivePackage.toJson(),
        "role": role,
        "package_name": packageName,
      };

  UserProfileEntity toEntity() {
    return UserProfileEntity(
        id: id,
        ipAddress: ipAddress,
        username: username,
        email: email,
        dialCode: dialCode,
        mobile: mobile,
        mobileVerified: mobileVerified,
        createdOn: createdOn,
        createdUid: createdUid,
        active: active,
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        userImage: userImage,
        userPhoneOtp: userPhoneOtp,
        userDeviceToken: userDeviceToken,
        userDeviceType: userDeviceType,
        userAccessToken: userAccessToken,
        fcmToken: fcmToken,
        firebaseUserKey: firebaseUserKey,
        tempDialCode: tempDialCode,
        tempMobile: tempMobile,
        displayName: displayName,
        updatedOn: updatedOn,
        updatedUid: updatedUid,
        countryId: countryId,
        stateId: stateId,
        cityId: cityId,
        oodleToken: oodleToken,
        passwordResetCode: passwordResetCode,
        passwordResetTime: passwordResetCode,
        loginType: loginType,
        aboutMe: aboutMe,
        isVerifiedUser: isVerifiedUser,
        gender: gender,
        userNationality: userNationality,
        skillsDescription: skillsDescription,
        updatedAt: updatedAt,
        verificationImage: verificationImage,
        packageId: packageId,
        accountNumber: accountNumber,
        accountTitle: accountTitle,
        swiftNumber: swiftNumber,
        ibanNumber: ibanNumber,
        bankName: bankName,
        activePackageId: activePackageId,
        tempOtp: tempOtp,
        userType: userType,
        roleId: roleId,
        skillCategoryId: skillCategoryId,
        reviewsCount: reviewsCount,
        rattingsCount: rattingsCount,
        languages: languages,
        createdAt: createdAt,
        googleProviderId: googleProviderId,
        isRecurring: isRecurring,
        subscriptionId: subscriptionId,
        passportImage: passportImage,
        idImage: idImage,
        addressProof: addressProof,
        driversLicense: driversLicense,
        emiratesId: emiratesId,
        uuid: uuid,
        isUaepassLogin: isUaepassLogin,
        userNationalityName: userNationalityName,
        package: package,
        ratingsReviews: ratingsReviews,
        userGender: userGender,
        nationality: nationality,
        userSkills: userSkills,
        country: country,
        userActivePackages: userActivePackages,
        currentActivePackage: currentActivePackage,
        role: role,
        packageName: packageName);
  }
}

class UserProfileResponse {
  final bool status;
  final String message;
  final UserProfileEntity oData;

  const UserProfileResponse({
    required this.status,
    required this.message,
    required this.oData,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'oData': oData,
    };
  }

  factory UserProfileResponse.fromMap(Map<String, dynamic> map) {
    return UserProfileResponse(
      status: map['status'] as bool,
      message: map['message'] as String,
      oData: UserProfileModel.fromJson(map['oData'] as Map<String, dynamic>)
          .toEntity(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileResponse.fromJson(String source) =>
      UserProfileResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
