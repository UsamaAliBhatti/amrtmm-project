import 'package:animated_custom_dropdown/custom_dropdown.dart';

class NationalityEntity with CustomDropdownListFilter {
  final String id;
  final String nationalityNameEn;
  final String nationalityNameAr;
  final String countryName;

  const NationalityEntity({
    required this.id,
    required this.nationalityNameEn,
    required this.nationalityNameAr,
    required this.countryName,
  });

  @override
  bool filter(String query) {
    return countryName.toLowerCase().contains(query.toLowerCase());
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NationalityEntity &&
        other.id == id &&
        other.countryName == countryName;
  }

  @override
  int get hashCode => id.hashCode ^ countryName.hashCode;
}
