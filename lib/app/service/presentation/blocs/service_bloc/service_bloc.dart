// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:amrtmm_project/app/service/domain/entities/skill_entity.dart';
import 'package:amrtmm_project/app/service/domain/usecases/service_usecases.dart';
import 'package:amrtmm_project/core/utils/functions/app_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/enums/status.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final FetchSkillsUC skillsUC;
  final CreateTaskUsecase createTaskUsecase;
  final CheckSubcriptionUsecase subcriptionUsecase;
  ServiceBloc({
    required this.skillsUC,
    required this.subcriptionUsecase,
    required this.createTaskUsecase,
  }) : super(const ServiceState()) {
    on<SelectServiceTypeEvent>(_onSelectServiceType);
    on<SelectSkillsEvent>(_onSelectSkills);
    on<FetchSkillsEvent>(_onSkillsFetch);
    on<CheckSubscriptionEvent>(_onCheckSubsription);
    on<SelectUserImageEvent>(_onSelectUserImage);
    on<OpenDateAndTimeDialogEvent>(_onOpenDateAndTimeDialog);
  }

  _onOpenDateAndTimeDialog(
      OpenDateAndTimeDialogEvent event, Emitter<ServiceState> emit) {
    final prevState = state;
    emit(OpenDateAndTimeDialogState());
    emit(prevState);
  }

  _onSelectUserImage(
      SelectUserImageEvent event, Emitter<ServiceState> emit) async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      final selectedFile = File(file.path);
      emit(state.copyWith(file: selectedFile));
    }
    return null;
  }

  _onSelectServiceType(
      SelectServiceTypeEvent event, Emitter<ServiceState> emit) {
    emit(state.copyWith(selectedServiceType: event.serviceType));
  }

  _onSelectSkills(SelectSkillsEvent event, Emitter<ServiceState> emit) {
    emit(state.copyWith(selectedSkills: event.skills));
  }

  _onSkillsFetch(FetchSkillsEvent event, Emitter<ServiceState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await skillsUC.call();
    if (result.status) {
      log(result.data.toString());
      emit(state.copyWith(status: Status.success, skills: result.data));
      return;
    }
    emit(state.copyWith(status: Status.error));
  }

  _onCheckSubsription(
      CheckSubscriptionEvent event, Emitter<ServiceState> emit) async {
    emit(state.copyWith(serviceStatus: Status.loading));
    final result = await subcriptionUsecase.call();
    if (result.data ?? false) {
      String skillIds =
          state.selectedSkills.map((skill) => skill.id.toString()).join(',');
      final response = await createTaskUsecase.call(params: {
        "title": event.title,
        "description": event.description,
        "result": event.result,
        'budget': event.budget,
        'serviceType': state.selectedServiceType,
        'date': event.dateTime,
        'skills': skillIds,
        'location': event.location,
        'file': state.file,
      });
      if (response.status) {
        emit(state.copyWith(serviceStatus: Status.success));
        final prevState = state;
        emit(CreateTaskSuccessState());
        emit(prevState);
        return;
      }
      emit(state.copyWith(serviceStatus: Status.error));
      showToast(msg: "Cannot create service right now. Try again later");
      return;
    }
    showToast(msg: result.message);
    emit(state.copyWith(serviceStatus: Status.error));
  }
}
