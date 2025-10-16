part of 'product_bloc.dart';

class ProductState extends Equatable {
  final AppStateStatus stateStatus;
  final AppError? error;
  final List<ProductEntity> products;

  const ProductState({
    required this.stateStatus,
    this.error,
    this.products = const [],
  });

  @override
  List<Object?> get props => [stateStatus, error];

  ProductState copyWith({
    AppStateStatus? stateStatus,
    AppError? error,
    final List<ProductEntity>? products,
  }) {
    return ProductState(
      stateStatus: stateStatus ?? this.stateStatus,
      error: error ?? this.error,
      products: products ?? this.products,
    );
  }
}
