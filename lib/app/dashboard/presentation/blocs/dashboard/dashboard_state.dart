// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final Status status;
  final String errorMessage;
  final DashboardSummaryEntity? dashboardSummary;
  const DashboardState({
    this.status = Status.initial,
    this.errorMessage = '',
    this.dashboardSummary,
  });

  @override
  List<Object?> get props => [status, errorMessage, dashboardSummary];

  DashboardState copyWith({
    Status? status,
    String? errorMessage,
    DashboardSummaryEntity? dashboardSummary,
  }) {
    return DashboardState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      dashboardSummary: dashboardSummary ?? this.dashboardSummary,
    );
  }
}
