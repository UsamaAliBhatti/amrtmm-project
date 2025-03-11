part of 'common_screen_bloc.dart';

class CommonScreenEvent extends Equatable {
  const CommonScreenEvent();

  @override
  List<Object> get props => [];
}

class FetchScreenDataEvent extends CommonScreenEvent {
  final int screenNum;

  const FetchScreenDataEvent({required this.screenNum});
}
