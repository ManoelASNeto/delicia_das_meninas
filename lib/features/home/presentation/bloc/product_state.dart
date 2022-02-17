part of 'product_bloc.dart';

enum ProductStatus {
  loading,
  ready,
  error,
}

class HomeState extends Equatable {
  final ProductStatus status;
  final List<Products>? product;
  final String? message;

  const HomeState._(this.status, this.product, this.message);

  const HomeState.initial() : this._(ProductStatus.loading, null, null);

  HomeState loading() {
    return HomeState._(ProductStatus.loading, product, message);
  }

  HomeState ready(List<Products>? product) {
    return HomeState._(ProductStatus.ready, product, message);
  }

  HomeState error(String? msgError) {
    return HomeState._(ProductStatus.error, product, msgError);
  }

  @override
  List<Object?> get props => [
        status,
        product,
        message,
      ];
}
