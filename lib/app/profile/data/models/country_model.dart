import '../../domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  const CountryModel({
    required String id,
    required String iso,
    required String titleName,
    required String name,
    required String iso3,
    required String numcode,
    required String dialCode,
    required bool active,
    required bool deleted,
    required String createdBy,
    required DateTime createdOn,
    required String updatedBy,
    required DateTime updatedOn,
    String? countryNameAr,
    String? countryNameEn,
  }) : super(
          id: id,
          iso: iso,
          titleName: titleName,
          name: name,
          iso3: iso3,
          numcode: numcode,
          dialCode: dialCode,
          active: active,
          deleted: deleted,
          createdBy: createdBy,
          createdOn: createdOn,
          updatedBy: updatedBy,
          updatedOn: updatedOn,
          countryNameAr: countryNameAr,
          countryNameEn: countryNameEn,
        );

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'].toString(),
      iso: json['iso'],
      titleName: json['title_name'],
      name: json['name'],
      iso3: json['iso3'],
      numcode: json['numcode'].toString(),
      dialCode: json['dial_code'].toString(),
      active: json['active'] == 1,
      deleted: json['deleted'] == 1,
      createdBy: json['created_by'].toString(),
      createdOn: DateTime.parse(json['created_on']),
      updatedBy: json['updated_by'].toString(),
      updatedOn: DateTime.parse(json['updated_on']),
      countryNameAr:
          json['country_name_ar'] != "NULL" ? json['country_name_ar'] : null,
      countryNameEn:
          json['country_name_en'] != "NULL" ? json['country_name_en'] : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "iso": iso,
        "title_name": titleName,
        "name": name,
        "iso3": iso3,
        "numcode": numcode,
        "dial_code": dialCode,
        "active": active,
        "deleted": deleted,
        "created_by": createdBy,
        "created_on": createdOn.toIso8601String(),
        "updated_by": updatedBy,
        "updated_on": updatedOn.toIso8601String(),
        "country_name_ar": countryNameAr,
        "country_name_en": countryNameEn,
      };

  CountryEntity toEntity(CountryModel model) {
    return CountryEntity(
      id: model.id,
      iso: model.iso,
      titleName: model.titleName,
      name: model.name,
      iso3: model.iso3,
      numcode: model.numcode,
      dialCode: model.dialCode,
      active: model.active,
      deleted: model.deleted,
      createdBy: model.createdBy,
      createdOn: model.createdOn,
      updatedBy: model.updatedBy,
      updatedOn: model.updatedOn,
      countryNameAr: model.countryNameAr,
      countryNameEn: model.countryNameEn,
    );
  }
}

class CountryResponseModel {
  final bool status;
  final String message;
  final List<CountryModel> countries;

  CountryResponseModel({
    required this.status,
    required this.message,
    required this.countries,
  });

  factory CountryResponseModel.fromJson(Map<String, dynamic> json) {
    return CountryResponseModel(
      status: json['status'],
      message: json['message'],
      countries:
          (json['oData'] as List).map((e) => CountryModel.fromJson(e)).toList(),
    );
  }
}
