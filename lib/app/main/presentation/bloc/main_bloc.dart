import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<TabChangedEvent>((event, emit) {
      emit(state.copyWith(currentTabIndex: event.newTabIndex));
    });

    on<BackButtonPressedEvent>((event, emit) {
      if (state.currentTabIndex > 0) {
        emit(state.copyWith(currentTabIndex: state.currentTabIndex - 1));
      } else {
        emit(state); // No change if on the first tab
      }
    });
  }
}
