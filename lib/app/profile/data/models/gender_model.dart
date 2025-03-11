import '../../domain/entities/gender_entity.dart';

class UserGenderModel extends UserGenderEntity {
  UserGenderModel({
    required String id,
    required String genderNameEn,
    required String genderNameAr,
  }) : super(id: id, genderNameAr: genderNameAr, genderNameEn: genderNameEn);

  factory UserGenderModel.fromJson(Map<String, dynamic> json) =>
      UserGenderModel(
        id: json["id"],
        genderNameEn: json["gender_name_en"],
        genderNameAr: json["gender_name_ar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gender_name_en": genderNameEn,
        "gender_name_ar": genderNameAr,
      };
  UserGenderEntity toEntity() {
    return UserGenderEntity(
      id: id,
      genderNameEn: genderNameEn,
      genderNameAr: genderNameAr,
    );
  }
}
