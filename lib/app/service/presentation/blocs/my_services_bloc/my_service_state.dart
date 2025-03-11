// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'my_service_bloc.dart';

class MyServiceState extends Equatable {
  final Status status;
  final int tab;
  const MyServiceState({
    this.status = Status.initial,
    this.tab = 0,
  });

  @override
  List<Object?> get props => [tab, status];

  MyServiceState copyWith({
    Status? status,
    int? tab,
  }) {
    return MyServiceState(
      status: status ?? this.status,
      tab: tab ?? this.tab,
    );
  }
}
