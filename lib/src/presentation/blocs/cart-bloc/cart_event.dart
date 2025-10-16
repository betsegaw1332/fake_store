part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCartItemsEvent extends CartEvent {
  GetCartItemsEvent();
}

class AddToCartEvent extends CartEvent {
  final ProductEntity productData;

  AddToCartEvent({required this.productData});

  @override
  List<Object?> get props => [productData];
}

class UpdateProductQuantityEvent extends CartEvent {
  final int productID;
  final int newQuantity;

  UpdateProductQuantityEvent({
    required this.productID,
    required this.newQuantity,
  });
}

class RemoveCartItemEvent extends CartEvent {
  final int productID;

  RemoveCartItemEvent({required this.productID});
}
