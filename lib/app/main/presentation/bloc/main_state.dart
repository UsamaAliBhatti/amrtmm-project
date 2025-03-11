part of 'main_bloc.dart';

class MainState extends Equatable {
  final int currentTabIndex;

  const MainState({this.currentTabIndex = 0});

  MainState copyWith({int? currentTabIndex}) {
    return MainState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
    );
  }

  @override
  List<Object?> get props => [currentTabIndex];
}
