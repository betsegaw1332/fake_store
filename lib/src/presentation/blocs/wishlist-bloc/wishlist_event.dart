part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFavoriteProductsEvent extends WishlistEvent {
  GetFavoriteProductsEvent();
}

class AddRemoveFavoriteProductEvent extends WishlistEvent {
  final WishlistProductEntity productData;

  AddRemoveFavoriteProductEvent({required this.productData});

  @override
  List<Object?> get props => [productData];
}
