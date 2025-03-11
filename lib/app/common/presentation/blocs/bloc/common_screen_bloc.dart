import 'package:amrtmm_project/app/common/domain/usecases/common_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/enums/status.dart';
import '../../../../../core/utils/res/api_response.dart';
import '../../../domain/entities/common_entity.dart';

part 'common_screen_event.dart';
part 'common_screen_state.dart';

class CommonScreenBloc extends Bloc<CommonScreenEvent, CommonScreenState> {
  final CommonUsecase usecase;
  CommonScreenBloc({required this.usecase}) : super(const CommonScreenState()) {
    on<FetchScreenDataEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      switch (event.screenNum) {
        case 1:
          final response = await usecase.call(params: APIConst.aboutUs);
          if (response.status) {
            emit(state.copyWith(
              status: Status.success,
              data: response,
            ));
            return;
          }
          emit(state.copyWith(
            status: Status.error,
            data: response,
          ));
          break;

        case 2:
          final response =
              await usecase.call(params: APIConst.termsAndConditions);
          if (response.status) {
            emit(state.copyWith(
              status: Status.success,
              data: response,
            ));
            return;
          }
          emit(state.copyWith(
            status: Status.error,
            data: response,
          ));
          break;
        case 3:
          final response = await usecase.call(params: APIConst.dmcaPolicy);
          if (response.status) {
            emit(state.copyWith(
              status: Status.success,
              data: response,
            ));
            return;
          }
          emit(state.copyWith(
            status: Status.error,
            data: response,
          ));
          break;
        case 4:
          final response =
              await usecase.call(params: APIConst.termsAndConditions);
          if (response.status) {
            emit(state.copyWith(
              status: Status.success,
              data: response,
            ));
            return;
          }
          emit(state.copyWith(
            status: Status.error,
            data: response,
          ));
          break;
        case 5:
          final response = await usecase.call(params: APIConst.privacyPolicy);
          if (response.status) {
            emit(state.copyWith(
              status: Status.success,
              data: response,
            ));
            return;
          }
          emit(state.copyWith(
            status: Status.error,
            data: response,
          ));
          break;
      }
    });
  }
}
