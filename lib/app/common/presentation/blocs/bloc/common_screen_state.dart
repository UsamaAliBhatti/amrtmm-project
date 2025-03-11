// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'common_screen_bloc.dart';

class CommonScreenState extends Equatable {
  final Status status;
  final ApiResponse<CommonEntity>? data;
  const CommonScreenState({
    this.status = Status.loading,
    this.data,
  });

  @override
  List<Object?> get props => [data, status];

  CommonScreenState copyWith({
    Status? status,
    ApiResponse<CommonEntity>? data,
  }) {
    return CommonScreenState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}

final class CommonScreenInitial extends CommonScreenState {}
