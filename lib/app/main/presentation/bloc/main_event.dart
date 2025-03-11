// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_bloc.dart';

class MainEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TabChangedEvent extends MainEvent {
  final int newTabIndex;

  TabChangedEvent({required this.newTabIndex});
}

class BackButtonPressedEvent extends MainEvent {}
