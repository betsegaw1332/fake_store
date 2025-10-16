part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFavoriteProductsEvent extends FavoriteEvent {
  GetFavoriteProductsEvent();
}

class AddRemoveFavoriteProductEvent extends FavoriteEvent {
  final FavoriteProductEntity productData;

  AddRemoveFavoriteProductEvent({required this.productData});

  @override
  List<Object?> get props => [productData];
}
