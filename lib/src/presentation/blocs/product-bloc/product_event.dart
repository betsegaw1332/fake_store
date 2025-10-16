part of "product_bloc.dart";

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductEvent {
  GetProductsEvent();
}
