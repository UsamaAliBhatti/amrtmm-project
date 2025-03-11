// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'all_tasks_bloc.dart';

class AllTasksState extends Equatable {
  final List<String> choices;
  final String selectedChoice;
  final String selectedSorting;
  final List<TaskEntity> allTasks;
  final Status status;
  final Status sendQuotation;
  final int minBudget;
  final int maxBudget;
  final int selectedMinBudget;
  final int selectedMaxBudget;
  final TaskEntity? taskDetail;

  const AllTasksState({
    this.choices = const ["Jobs", "Talents"],
    this.selectedChoice = "Jobs",
    this.selectedSorting = "",
    this.allTasks = const [],
    this.minBudget = 0,
    this.maxBudget = 0,
    this.status = Status.initial,
    this.selectedMinBudget = 0,
    this.selectedMaxBudget = 0,
    this.taskDetail,
    this.sendQuotation = Status.initial,
  });

  @override
  List<Object?> get props => [
        choices,
        selectedChoice,
        allTasks,
        status,
        selectedSorting,
        minBudget,
        maxBudget,
        selectedMinBudget,
        selectedMaxBudget,
        taskDetail,
        sendQuotation,
      ];

  AllTasksState copyWith({
    List<String>? choices,
    String? selectedChoice,
    String? selectedSorting,
    List<TaskEntity>? allTasks,
    Status? status,
    int? minBudget,
    int? maxBudget,
    int? selectedMinBudget,
    int? selectedMaxBudget,
    TaskEntity? taskDetail,
    Status? sendQuotation,
  }) {
    return AllTasksState(
      choices: choices ?? this.choices,
      selectedChoice: selectedChoice ?? this.selectedChoice,
      allTasks: allTasks ?? this.allTasks,
      selectedSorting: selectedSorting ?? this.selectedSorting,
      status: status ?? this.status,
      minBudget: minBudget ?? this.minBudget,
      maxBudget: maxBudget ?? this.maxBudget,
      selectedMinBudget: selectedMinBudget ?? this.selectedMinBudget,
      selectedMaxBudget: selectedMaxBudget ?? this.selectedMaxBudget,
      taskDetail: taskDetail ?? this.taskDetail,
      sendQuotation: sendQuotation ?? this.sendQuotation,
    );
  }
}

class FilterDialogState extends AllTasksState {}

class SendQuotationSuccessState extends AllTasksState {}
