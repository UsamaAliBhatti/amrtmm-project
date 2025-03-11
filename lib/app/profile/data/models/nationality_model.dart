import 'package:amrtmm_project/app/profile/domain/entities/nationality_entity.dart';

class NationalityModel extends NationalityEntity {
  NationalityModel({
    required String id,
    required String nationalityNameEn,
    required String nationalityNameAr,
    required String countryName,
  }) : super(
            id: id,
            nationalityNameEn: nationalityNameEn,
            nationalityNameAr: nationalityNameAr,
            countryName: countryName);

  factory NationalityModel.fromJson(Map<String, dynamic> json) =>
      NationalityModel(
        id: json["id"].toString(),
        nationalityNameEn: json["nationality_name_en"] ?? "",
        nationalityNameAr: json["nationality_name_ar"] ?? "",
        countryName: json["country_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nationality_name_en": nationalityNameEn,
        "nationality_name_ar": nationalityNameAr,
        "country_name": countryName,
      };

  NationalityEntity toEntity() {
    return NationalityEntity(
        id: id,
        nationalityNameEn: nationalityNameEn,
        nationalityNameAr: nationalityNameAr,
        countryName: countryName);
  }
}

class NationlaityResponseModel {
  final bool status;
  final String message;
  final List<NationalityEntity> nationalities;

  NationlaityResponseModel({
    required this.status,
    required this.message,
    required this.nationalities,
  });

  factory NationlaityResponseModel.fromJson(Map<String, dynamic> json) {
    return NationlaityResponseModel(
      status: json['status'],
      message: json['message'],
      nationalities: (json['oData'] as List)
          .map((e) => NationalityModel.fromJson(e))
          .toList(),
    );
  }
}
