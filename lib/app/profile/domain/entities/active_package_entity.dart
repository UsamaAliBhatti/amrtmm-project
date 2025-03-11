class UserActivePackageEntity {
  final String id;
  final String userId;
  final String packageId;
  final String packageDays;
  final String isFreePackage;
  final String packageServiceCount;
  final String packageQuotationCount;
  final String usedServiceCount;
  final String usedQuotationCount;
  final String userPackageStatus;
  final String expiryDateTime;
  final String createdDate;
  final String createdAt;
  final String updatedAt;

  const UserActivePackageEntity({
    required this.id,
    required this.userId,
    required this.packageId,
    required this.packageDays,
    required this.isFreePackage,
    required this.packageServiceCount,
    required this.packageQuotationCount,
    required this.usedServiceCount,
    required this.usedQuotationCount,
    required this.userPackageStatus,
    required this.expiryDateTime,
    required this.createdDate,
    required this.createdAt,
    required this.updatedAt,
  });
}
