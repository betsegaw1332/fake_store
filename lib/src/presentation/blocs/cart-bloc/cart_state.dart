part of 'cart_bloc.dart';

class CartState extends Equatable {
  final AppStateStatus stateStatus;
  final AppError? error;
  final List<CartItemEntity> cartItems;
  final double totalPrice;

  const CartState({
    required this.stateStatus,
    this.error,
    this.cartItems = const [],
    this.totalPrice = 0,
  });

  @override
  List<Object?> get props => [stateStatus, error];

  CartState copyWith({
    AppStateStatus? stateStatus,
    AppError? error,
    final List<CartItemEntity>? cartItems,
    double? totalPrice,
  }) {
    return CartState(
      stateStatus: stateStatus ?? this.stateStatus,
      error: error ?? this.error,
      cartItems: cartItems ?? this.cartItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
