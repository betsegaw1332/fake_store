part of 'wishlist_bloc.dart';

class WishlistState extends Equatable {
  final AppStateStatus stateStatus;
  final AppError? error;
  final List<WishlistProductEntity> favoriteProducts;

  const WishlistState({
    required this.stateStatus,
    this.error,
    this.favoriteProducts = const [],
  });

  @override
  List<Object?> get props => [stateStatus, error];

  WishlistState copyWith({
    AppStateStatus? stateStatus,
    AppError? error,
    final List<WishlistProductEntity>? favoriteProducts,
  }) {
    return WishlistState(
      stateStatus: stateStatus ?? this.stateStatus,
      error: error ?? this.error,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
    );
  }
}
