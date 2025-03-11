class ContactUsEntity {
  final bool status;
  final String message;
  final ContactUsDataEntity data;

  ContactUsEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class ContactUsDataEntity {
  final int id;
  final String titleEn;
  final String titleAr;
  final String? email;
  final String? mobile;
  final String descEn;
  final String descAr;
  final String? location;
  final double? latitude;
  final double? longitude;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int tasksCount;
  final int happyCustomersCount;
  final int activeUsersCount;
  final int storiesCount;
  final String facebook;
  final String twitter;
  final String linkedin;
  final String instagram;
  final String adminEmail;

  ContactUsDataEntity({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    this.email,
    this.mobile,
    required this.descEn,
    required this.descAr,
    this.location,
    this.latitude,
    this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.tasksCount,
    required this.happyCustomersCount,
    required this.activeUsersCount,
    required this.storiesCount,
    required this.facebook,
    required this.twitter,
    required this.linkedin,
    required this.instagram,
    required this.adminEmail,
  });
}
