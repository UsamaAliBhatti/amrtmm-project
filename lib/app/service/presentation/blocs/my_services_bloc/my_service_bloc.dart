import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/enums/status.dart';

part 'my_service_event.dart';
part 'my_service_state.dart';

class MyServiceBloc extends Bloc<MyServiceEvent, MyServiceState> {
  MyServiceBloc() : super(const MyServiceState()) {
    on<ChangeTabEvent>(_onChangeTab);
  }

  _onChangeTab(ChangeTabEvent event, Emitter<MyServiceState> emit) {
    emit(state.copyWith(tab: event.index));
  }
}
