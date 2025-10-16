import 'package:equatable/equatable.dart';

abstract class AppError extends Equatable {
  const AppError({this.message});

  final String? message;
  @override
  List<Object?> get props => [message];
}

class UserSigninFailed extends AppError {
  const UserSigninFailed({super.message = "user login error"});
}

class GetProductsFailed extends AppError {
  const GetProductsFailed({
    super.message = "Couldn't fetch products, Please try again",
  });
}

class AddToCartFailed extends AppError {
  const AddToCartFailed({super.message = "Failed to add product to cart"});
}

class UpdateQuantityFailed extends AppError {
  const UpdateQuantityFailed({
    super.message = "Failed to update product quantity",
  });
}

class RemoveCartItemFailed extends AppError {
  const RemoveCartItemFailed({super.message = "Failed to remove cart item"});
}

class AddRemoveToFavoriteFailed extends AppError {
  const AddRemoveToFavoriteFailed({
    super.message = "Failed to add product to favorite",
  });
}
