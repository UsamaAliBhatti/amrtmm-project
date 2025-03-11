// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'my_service_bloc.dart';

class MyServiceEvent extends Equatable {
  const MyServiceEvent();

  @override
  List<Object> get props => [];
}

class ChangeTabEvent extends MyServiceEvent {
  final int index;
  const ChangeTabEvent({
    required this.index,
  });
}
