import '../../domain/entities/contact_us_entity.dart';

class ContactUsModel {
  final bool status;
  final String message;
  final ContactUsDataModel data;

  ContactUsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  // Deserialize JSON into ContactUsModel
  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    return ContactUsModel(
      status: json['status'],
      message: json['message'],
      data: ContactUsDataModel.fromJson(json['data']),
    );
  }

  // Convert the model to its entity equivalent
  ContactUsEntity toEntity() {
    return ContactUsEntity(
      status: status,
      message: message,
      data: data.toEntity(),
    );
  }
}

class ContactUsDataModel {
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

  ContactUsDataModel({
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

  // Deserialize JSON into ContactUsDataModel
  factory ContactUsDataModel.fromJson(Map<String, dynamic> json) {
    return ContactUsDataModel(
      id: json['id'],
      titleEn: json['title_en'],
      titleAr: json['title_ar'],
      email: json['email'],
      mobile: json['mobile'],
      descEn: json['desc_en'],
      descAr: json['desc_ar'],
      location: json['location'],
      latitude: json['latitude'] != null
          ? double.tryParse(json['latitude'].toString())
          : null,
      longitude: json['longitude'] != null
          ? double.tryParse(json['longitude'].toString())
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      tasksCount: json['tasks_count'],
      happyCustomersCount: json['happy_customers_count'],
      activeUsersCount: json['active_users_count'],
      storiesCount: json['stories_count'],
      facebook: json['facebook'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
      instagram: json['instagram'],
      adminEmail: json['admin_email'],
    );
  }

  // Convert the model to its entity equivalent
  ContactUsDataEntity toEntity() {
    return ContactUsDataEntity(
      id: id,
      titleEn: titleEn,
      titleAr: titleAr,
      email: email,
      mobile: mobile,
      descEn: descEn,
      descAr: descAr,
      location: location,
      latitude: latitude,
      longitude: longitude,
      createdAt: createdAt,
      updatedAt: updatedAt,
      tasksCount: tasksCount,
      happyCustomersCount: happyCustomersCount,
      activeUsersCount: activeUsersCount,
      storiesCount: storiesCount,
      facebook: facebook,
      twitter: twitter,
      linkedin: linkedin,
      instagram: instagram,
      adminEmail: adminEmail,
    );
  }
}
