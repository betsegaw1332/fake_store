import 'package:equatable/equatable.dart';
import 'package:fake_store/src/config/data_state.dart';
import 'package:fake_store/src/data/data.dart';
import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(stateStatus: AppStateStatus.initial)) {
    on<GetCartItemsEvent>(_onGetCarts);
    on<AddToCartEvent>(_onAddToCartEvent);
    on<UpdateProductQuantityEvent>(_onUpdateProductQuantity);
    on<RemoveCartItemEvent>(_onRemoveCartItem);
  }
  double getCartTotal({required List<CartItemEntity> cartItems}) {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  Future<void> _onGetCarts(
    GetCartItemsEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(
      CartState(
        stateStatus: AppStateStatus.loadingBody,
        cartItems: List.generate(5, (index) => CartItemEntity.mockData()),
      ),
    );

    final cartItems = await CartLocalStorage.getCartItems();
    var total = getCartTotal(cartItems: cartItems);
    emit(
      CartState(
        stateStatus: AppStateStatus.successLoaded,
        cartItems: cartItems,
        totalPrice: total,
      ),
    );
  }

  Future<void> _onAddToCartEvent(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartState(stateStatus: AppStateStatus.loadingBody));

    var response = await CartLocalStorage.addOrUpdateItem(
      newItem: CartItemEntity.fromProductEntity(productData: event.productData),
    );

    if (response is DataSuccess) {
      emit(CartState(stateStatus: AppStateStatus.successSubmit));
    } else {
      emit(
        CartState(stateStatus: AppStateStatus.error, error: AddToCartFailed()),
      );
    }
  }

  Future<void> _onUpdateProductQuantity(
    UpdateProductQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartState(stateStatus: AppStateStatus.loadingBody));

    var response = await CartLocalStorage.updateQuantity(
      itemId: event.productID,
      newQuantity: event.newQuantity,
    );

    if (response is DataSuccess) {
      emit(
        CartState(
          stateStatus: AppStateStatus.successSubmit,
          cartItems: state.cartItems,
        ),
      );
    } else {
      emit(
        CartState(
          stateStatus: AppStateStatus.error,
          error: UpdateQuantityFailed(),
          cartItems: state.cartItems,
        ),
      );
    }
  }

  Future<void> _onRemoveCartItem(
    RemoveCartItemEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartState(stateStatus: AppStateStatus.loadingBody));

    var response = await CartLocalStorage.removeItem(itemId: event.productID);

    if (response is DataSuccess) {

      emit(
        CartState(
          stateStatus: AppStateStatus.successSubmit,
        ),
      );
    } else {
      emit(
        CartState(
          stateStatus: AppStateStatus.error,
          error: RemoveCartItemFailed(),
        ),
      );
    }
  }
}
