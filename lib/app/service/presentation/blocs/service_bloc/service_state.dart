// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'service_bloc.dart';

class ServiceState extends Equatable {
  final Status status;
  final Status serviceStatus;
  final List<SkillEntity> skills;
  final List<SkillEntity> selectedSkills;
  final String selectedServiceType;
  final List<String> serviceTypes;
  final File? file;
  const ServiceState(
      {this.status = Status.initial,
      this.serviceStatus = Status.initial,
      this.skills = const [],
      this.serviceTypes = const ["Fixed", "Hourly", "Weekly", "Monthly"],
      this.selectedSkills = const [],
      this.selectedServiceType = "",
      this.file});

  @override
  List<Object?> get props => [
        status,
        skills,
        serviceStatus,
        serviceTypes,
        selectedSkills,
        selectedServiceType,
        file,
      ];

  ServiceState copyWith(
      {Status? status,
      Status? serviceStatus,
      List<SkillEntity>? skills,
      List<SkillEntity>? selectedSkills,
      String? selectedServiceType,
      List<String>? serviceTypes,
      File? file}) {
    return ServiceState(
      status: status ?? this.status,
      serviceStatus: serviceStatus ?? this.serviceStatus,
      skills: skills ?? this.skills,
      selectedSkills: selectedSkills ?? this.selectedSkills,
      selectedServiceType: selectedServiceType ?? this.selectedServiceType,
      serviceTypes: serviceTypes ?? this.serviceTypes,
      file: file ?? this.file,
    );
  }
}

class OpenDateAndTimeDialogState extends ServiceState {}

class CreateTaskSuccessState extends ServiceState {}
