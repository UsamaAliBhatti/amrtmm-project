class PackageEntity {
  final String id;
  final String packageNameEn;
  final String packageNameAr;
  final String packagePrice;
  final String serviceRequestCount;
  final String quotationCount;
  final String validityDays;
  final String isFreePackage;
  final String createdAt;
  final String updatedAt;
  final String active;
  final String isDeleted;
  final String sortOrderId;
  final String commission;
  final String stripePriceId;
  final String stripeProductId;
  final String noOfSkill;

  const PackageEntity({
    required this.id,
    required this.packageNameEn,
    required this.packageNameAr,
    required this.packagePrice,
    required this.serviceRequestCount,
    required this.quotationCount,
    required this.validityDays,
    required this.isFreePackage,
    required this.createdAt,
    required this.updatedAt,
    required this.active,
    required this.isDeleted,
    required this.sortOrderId,
    required this.commission,
    required this.stripePriceId,
    required this.stripeProductId,
    required this.noOfSkill,
  });
}
