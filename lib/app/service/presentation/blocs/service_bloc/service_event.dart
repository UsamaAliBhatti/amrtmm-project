// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'service_bloc.dart';

class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

class FetchSkillsEvent extends ServiceEvent {}

class CheckSubscriptionEvent extends ServiceEvent {
  final String title;
  final String description;
  final String dateTime;
  final String location;
  final String result;
  final String budget;
  const CheckSubscriptionEvent({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.location,
    required this.result,
    required this.budget,
  });
}

class SelectServiceTypeEvent extends ServiceEvent {
  final String serviceType;
  const SelectServiceTypeEvent({
    required this.serviceType,
  });
}

class SelectSkillsEvent extends ServiceEvent {
  final List<SkillEntity> skills;
  const SelectSkillsEvent({
    required this.skills,
  });
}

class SelectUserImageEvent extends ServiceEvent {}

class OpenDateAndTimeDialogEvent extends ServiceEvent {}
