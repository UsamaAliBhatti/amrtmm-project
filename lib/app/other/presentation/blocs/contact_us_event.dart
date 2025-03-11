// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contact_us_bloc.dart';

class ContactUsEvent extends Equatable {
  const ContactUsEvent();

  @override
  List<Object?> get props => [];
}

class FetchContactUsEvent extends ContactUsEvent {}

class SubmitUserQueryEvent extends ContactUsEvent {
  final Map<String, String> queryData;
  const SubmitUserQueryEvent({
    required this.queryData,
  });
}
