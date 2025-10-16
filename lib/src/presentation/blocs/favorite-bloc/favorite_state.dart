part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final AppStateStatus stateStatus;
  final AppError? error;
  final List<FavoriteProductEntity> favoriteProducts;

  const FavoriteState({
    required this.stateStatus,
    this.error,
    this.favoriteProducts = const [],
  });

  @override
  List<Object?> get props => [stateStatus, error];

  FavoriteState copyWith({
    AppStateStatus? stateStatus,
    AppError? error,
    final List<FavoriteProductEntity>? favoriteProducts,
  }) {
    return FavoriteState(
      stateStatus: stateStatus ?? this.stateStatus,
      error: error ?? this.error,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
    );
  }
}
