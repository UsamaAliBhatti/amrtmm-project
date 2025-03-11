import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/enums/status.dart';
import '../../../domain/entities/dashboard_summary_entity.dart';
import '../../../domain/usecases/dashboard_usecases.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardSummaryUseCase dashboardSummaryUseCase;
  DashboardBloc({required this.dashboardSummaryUseCase})
      : super(const DashboardState()) {
    on<FetchDashboardSummaryEvent>(_onFetchDashboardSummary);
  }

  void _onFetchDashboardSummary(
    FetchDashboardSummaryEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final response = await dashboardSummaryUseCase.call();
    if (response.status) {
      emit(state.copyWith(
        status: Status.success,
        dashboardSummary: response.data,
      ));
      return;
    }
    emit(state.copyWith(
      status: Status.error,
      errorMessage: response.message,
    ));
  }
}
