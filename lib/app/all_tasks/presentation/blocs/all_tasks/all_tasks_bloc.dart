import 'dart:developer';

import 'package:amrtmm_project/app/all_tasks/domain/entities/task_entity.dart';
import 'package:amrtmm_project/core/utils/functions/app_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/enums/status.dart';
import '../../../domain/usecases/all_tasks_usecases.dart';

part 'all_tasks_event.dart';
part 'all_tasks_state.dart';

class AllTasksBloc extends Bloc<AllTasksEvent, AllTasksState> {
  final FetchTasksUsecase usecase;
  final FetchTasksSuggestionsUsecase suggestionsUsecase;
  final FetchFilteredTasksUsecase filteredTasksUsecase;
  final FetchTaskDetailsUsecase taskDetailsUsecase;
  final SendQuotationUsecase sendQuotationUsecase;
  AllTasksBloc({
    required this.usecase,
    required this.suggestionsUsecase,
    required this.filteredTasksUsecase,
    required this.taskDetailsUsecase,
    required this.sendQuotationUsecase,
  }) : super(const AllTasksState()) {
    on<SelectChoiceEvent>(_onSelectChoice);
    on<FetchTasksEvent>(_onFetchTasks);
    on<FetchTasksSuggestionsEvent>(_onFetchTasksSuggestions);
    on<ShowFilterDialogEvent>(_onShowFilterDialog);
    on<SelectSortingTypeEvent>(_onSelectSortingType);
    on<SelectRangeEvent>(_onSelectBudgetRange);
    on<ResetFiltersEvent>(_onResetFilters);
    on<FetchFilterTasksEvent>(_onFetchFilterTasks);
    on<FetchTaskDetailEvent>(_onFetchTaskDetails);
    on<SendQuotationEvent>(_onSendQuotation);
  }

  _onSendQuotation(
      SendQuotationEvent event, Emitter<AllTasksState> emit) async {
    emit(state.copyWith(sendQuotation: Status.loading));

    final data = {
      "request_id": event.taskId,
      "descriptions": event.description,
      "price": event.price,
      "no_of_hours": event.hours,
      "validity": event.validity,
    };

    final result = await sendQuotationUsecase.call(params: data);
    if (result.status) {
      showToast(msg: "Quotation Sent Successfully");
      emit(state.copyWith(sendQuotation: Status.success));
      final prevState = state;
      emit(SendQuotationSuccessState());
      emit(prevState);
      return;
    }
    showToast(msg: result.message);
    emit(state.copyWith(sendQuotation: Status.error));
  }

  _onFetchTaskDetails(
      FetchTaskDetailEvent event, Emitter<AllTasksState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await taskDetailsUsecase.call(params: event.id);
    if (result.status) {
      log(result.data?.task.toString() ?? "NO DATA FOUND");
      emit(state.copyWith(
          status: Status.success, taskDetail: result.data?.task));
      return;
    }
    log(result.data?.task.toString() ?? "NO DATA FOUND");

    emit(state.copyWith(status: Status.error));
  }

  _onFetchFilterTasks(
      FetchFilterTasksEvent event, Emitter<AllTasksState> emit) async {
    emit(state.copyWith(status: Status.loading, allTasks: []));
    final filters = {
      "search[]": event.query,
      "sort": state.selectedSorting,
      "date": event.date,
      "min": state.selectedMinBudget == 0 ? '' : state.selectedMinBudget,
      "max": state.selectedMaxBudget == 0 ? '' : state.selectedMaxBudget,
    };
    log(filters.toString());
    final result = await filteredTasksUsecase.call(params: filters);
    if (result.status) {
      emit(state.copyWith(status: Status.success, allTasks: result.data));
      return;
    }
    emit(state.copyWith(status: Status.error));
    return null;
  }

  _onResetFilters(ResetFiltersEvent event, Emitter<AllTasksState> emit) {
    emit(state.copyWith(
      selectedMaxBudget: 0,
      selectedMinBudget: 0,
      selectedSorting: "",
    ));
    add(const FetchTasksEvent(choice: "Jobs"));
  }

  _onSelectBudgetRange(SelectRangeEvent event, Emitter<AllTasksState> emit) {
    emit(state.copyWith(
        selectedMinBudget: event.minBudget,
        selectedMaxBudget: event.maxBudget));
  }

  _onSelectSortingType(
      SelectSortingTypeEvent event, Emitter<AllTasksState> emit) {
    emit(state.copyWith(selectedSorting: event.sortingType));
  }

  _onShowFilterDialog(
      ShowFilterDialogEvent event, Emitter<AllTasksState> emit) {
    final prevState = state;
    emit(FilterDialogState());
    emit(prevState);
  }

  _onFetchTasksSuggestions(
      FetchTasksSuggestionsEvent event, Emitter<AllTasksState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await suggestionsUsecase.call(params: event.query);
    if (result.status) {
      emit(state.copyWith(allTasks: result.data, status: Status.success));
      return;
    }
    showToast(msg: result.message);
    emit(state.copyWith(status: Status.error));
    return null;
  }

  _onSelectChoice(SelectChoiceEvent event, Emitter<AllTasksState> emit) {
    emit(state.copyWith(selectedChoice: event.value));
    add(FetchTasksEvent(choice: event.value));
  }

  _onFetchTasks(FetchTasksEvent event, Emitter<AllTasksState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await usecase.call(params: event.choice);
    if (result.status) {
      emit(state.copyWith(
          allTasks: result.data?.requests,
          status: Status.success,
          maxBudget: result.data?.maxBudget));
      return;
    }
    showToast(msg: result.message);
    emit(state.copyWith(status: Status.error));
  }
}
