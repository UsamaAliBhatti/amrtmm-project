import 'package:animated_custom_dropdown/custom_dropdown.dart';

class CountryEntity with CustomDropdownListFilter {
  final String id;
  final String iso;
  final String titleName;
  final String name;
  final String iso3;
  final String numcode;
  final String dialCode;
  final bool active;
  final bool deleted;
  final String createdBy;
  final DateTime createdOn;
  final String updatedBy;
  final DateTime updatedOn;
  final String? countryNameAr;
  final String? countryNameEn;

  const CountryEntity({
    required this.id,
    required this.iso,
    required this.titleName,
    required this.name,
    required this.iso3,
    required this.numcode,
    required this.dialCode,
    required this.active,
    required this.deleted,
    required this.createdBy,
    required this.createdOn,
    required this.updatedBy,
    required this.updatedOn,
    this.countryNameAr,
    this.countryNameEn,
  });

  @override
  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }
}
