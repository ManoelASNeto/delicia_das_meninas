import 'package:bloc/bloc.dart';

import '../../../../core/erros/failures.dart';
import '../../../../core/ultis/app_strings.dart';
import '../../domain/usecases/get_highlight_use_case.dart';
import 'highlight_event.dart';
import 'highlight_state.dart';

class HighLightBloc extends Bloc<HighLightEvent, HighLightState> {
  final GetHighLightUseCase getHighLightUseCase;

  HighLightBloc(this.getHighLightUseCase) : super(HighLightState.initial()) {
    on<HighLight>(
      (event, emit) async {
        emit(state.loading());
        var fold = await getHighLightUseCase(event);
        emit(
          await fold.fold(
            (failure) => state.error(
              _mapHighLightFailureToString(failure),
            ),
            (getLightsUseCase) => state.ready(getLightsUseCase),
          ),
        );
      },
    );
  }

  String _mapHighLightFailureToString(Failure failures) {
    switch (failures.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      default:
        return AppStrings.error;
    }
  }
}
