import 'package:amrtmm_project/app/profile/domain/entities/active_package_entity.dart';

class ActivePackageModel extends UserActivePackageEntity {
  ActivePackageModel({
    required String id,
    required String userId,
    required String packageId,
    required String packageDays,
    required String isFreePackage,
    required String packageServiceCount,
    required String packageQuotationCount,
    required String usedServiceCount,
    required String usedQuotationCount,
    required String userPackageStatus,
    required String expiryDateTime,
    required String createdDate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
            id: id,
            userId: userId,
            packageId: packageId,
            packageDays: packageDays,
            isFreePackage: isFreePackage,
            packageServiceCount: packageServiceCount,
            packageQuotationCount: packageQuotationCount,
            usedServiceCount: usedServiceCount,
            usedQuotationCount: usedQuotationCount,
            userPackageStatus: userPackageStatus,
            expiryDateTime: expiryDateTime,
            createdDate: createdDate,
            createdAt: createdAt.toIso8601String(),
            updatedAt: updatedAt.toIso8601String());

  factory ActivePackageModel.fromJson(Map<String, dynamic> json) =>
      ActivePackageModel(
        id: json["id"],
        userId: json["user_id"],
        packageId: json["package_id"],
        packageDays: json["package_days"],
        isFreePackage: json["is_free_package"],
        packageServiceCount: json["package_service_count"],
        packageQuotationCount: json["package_quotation_count"],
        usedServiceCount: json["used_service_count"],
        usedQuotationCount: json["used_quotation_count"],
        userPackageStatus: json["user_package_status"],
        expiryDateTime: json["expiry_date_time"],
        createdDate: json["created_date"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "package_id": packageId,
        "package_days": packageDays,
        "is_free_package": isFreePackage,
        "package_service_count": packageServiceCount,
        "package_quotation_count": packageQuotationCount,
        "used_service_count": usedServiceCount,
        "used_quotation_count": usedQuotationCount,
        "user_package_status": userPackageStatus,
        "expiry_date_time": expiryDateTime,
        "created_date": createdDate,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  UserActivePackageEntity toEntity() {
    return UserActivePackageEntity(
        id: id,
        userId: userId,
        packageId: packageId,
        packageDays: packageDays,
        isFreePackage: isFreePackage,
        packageServiceCount: packageServiceCount,
        packageQuotationCount: packageQuotationCount,
        usedServiceCount: usedServiceCount,
        usedQuotationCount: usedQuotationCount,
        userPackageStatus: userPackageStatus,
        expiryDateTime: expiryDateTime,
        createdDate: createdDate,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }
}
