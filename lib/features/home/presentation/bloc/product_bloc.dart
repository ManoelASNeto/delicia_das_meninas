import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loja_delicia_das_meninas/core/erros/failures.dart';
import 'package:loja_delicia_das_meninas/core/ultis/app_strings.dart';
import 'package:loja_delicia_das_meninas/features/home/domain/entities/product_entity.dart';
import 'package:loja_delicia_das_meninas/features/home/domain/usecases/product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class HomeBloc extends Bloc<ProductEvent, HomeState> {
  final GetProduct getProduct;

  HomeBloc(this.getProduct) : super(const HomeState.initial()) {
    on<Product>((event, emit) async {
      emit(state.loading());
      var fold = await getProduct(event);
      emit(fold.fold(
          (failure) => state.error(_mapHomeFailureToString(failure)), (getProducts) => state.ready(getProducts)));
    });
  }

  String _mapHomeFailureToString(Failures failures) {
    return failures.maybeWhen(
      serverFailures: () => AppStrings.serverFailure,
      networkFailures: () => AppStrings.networkFailure,
      orElse: () => AppStrings.error,
    );
  }
}
