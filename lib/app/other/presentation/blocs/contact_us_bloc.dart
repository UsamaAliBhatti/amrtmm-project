import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/enums/status.dart';
import '../../../../core/utils/res/api_response.dart';
import '../../domain/entities/contact_us_entity.dart';
import '../../domain/usecases/contact_us_usecase.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  final ContactUsUsecase contactUsUsecase;
  final SubmitQueryUsecase submitQueryUsecase;

  ContactUsBloc({
    required this.contactUsUsecase,
    required this.submitQueryUsecase,
  }) : super(const ContactUsState()) {
    on<FetchContactUsEvent>(_onFetchContactUsEvent);
    on<SubmitUserQueryEvent>(_onSubmitUserQuery);
  }

  _onFetchContactUsEvent(
    FetchContactUsEvent event,
    Emitter<ContactUsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final response = await contactUsUsecase.call();

    if (response.status) {
      emit(state.copyWith(
        status: Status.success,
        contactUs: response,
      ));

      return;
    }
    emit(state.copyWith(
      status: Status.error,
      contactUs: response,
    ));
  }

  _onSubmitUserQuery(
      SubmitUserQueryEvent event, Emitter<ContactUsState> emit) async {
    emit(state.copyWith(querySubmissionState: Status.loading));
    final response = await submitQueryUsecase.call(params: event.queryData);
    if (response.status) {
      emit(state.copyWith(querySubmissionState: Status.success));
      final prevState = state;
      emit(SuccessSubmissionState());
      emit(prevState);
      return;
    }
    emit(state.copyWith(querySubmissionState: Status.error));
  }
}
