// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contact_us_bloc.dart';

class ContactUsState extends Equatable {
  final Status status;
  final Status querySubmissionState;
  final ApiResponse<ContactUsEntity>? contactUs;
  const ContactUsState({
    this.status = Status.initial,
    this.querySubmissionState = Status.initial,
    this.contactUs,
  });

  @override
  List<Object?> get props => [
        status,
        contactUs,
        querySubmissionState,
      ];

  ContactUsState copyWith({
    Status? status,
    Status? querySubmissionState,
    ApiResponse<ContactUsEntity>? contactUs,
  }) {
    return ContactUsState(
      status: status ?? this.status,
      querySubmissionState: querySubmissionState ?? this.querySubmissionState,
      contactUs: contactUs ?? this.contactUs,
    );
  }
}

class SuccessSubmissionState extends ContactUsState {}
