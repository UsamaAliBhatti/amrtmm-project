// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'all_tasks_bloc.dart';

class AllTasksEvent extends Equatable {
  const AllTasksEvent();

  @override
  List<Object> get props => [];
}

class SelectChoiceEvent extends AllTasksEvent {
  final String value;
  const SelectChoiceEvent({
    required this.value,
  });
}

class FetchTasksEvent extends AllTasksEvent {
  final String choice;
  const FetchTasksEvent({
    required this.choice,
  });
}

class FetchTasksSuggestionsEvent extends AllTasksEvent {
  final String query;
  const FetchTasksSuggestionsEvent({
    required this.query,
  });
}

class ShowFilterDialogEvent extends AllTasksEvent {}

class SelectSortingTypeEvent extends AllTasksEvent {
  final String sortingType;
  const SelectSortingTypeEvent({
    required this.sortingType,
  });
}

class SelectRangeEvent extends AllTasksEvent {
  final int maxBudget;
  final int minBudget;
  const SelectRangeEvent({
    required this.maxBudget,
    required this.minBudget,
  });
}

class ResetFiltersEvent extends AllTasksEvent {}

class FetchTaskDetailEvent extends AllTasksEvent {
  final int id;
  const FetchTaskDetailEvent({
    required this.id,
  });
}

class FetchFilterTasksEvent extends AllTasksEvent {
  final String query;
  final String date;
  const FetchFilterTasksEvent({
    required this.query,
    required this.date,
  });
}

class SendQuotationEvent extends AllTasksEvent {
  final int taskId;
  final String description;
  final String price;
  final String hours;
  final String validity;
  const SendQuotationEvent({
    required this.taskId,
    required this.description,
    required this.price,
    required this.hours,
    required this.validity,
  });
}
