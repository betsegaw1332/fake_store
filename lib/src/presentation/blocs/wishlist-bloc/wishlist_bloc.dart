import 'package:equatable/equatable.dart';
import 'package:fake_store/src/config/data_state.dart';
import 'package:fake_store/src/data/data.dart';
import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc()
    : super(const WishlistState(stateStatus: AppStateStatus.initial)) {
    on<GetFavoriteProductsEvent>(_onGetFavoriteProducts);
    on<AddRemoveFavoriteProductEvent>(_onAddRemoveToWishlistEvent);
  }

  Future<void> _onGetFavoriteProducts(
    GetFavoriteProductsEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(
      WishlistState(
        stateStatus: AppStateStatus.loadingBody,
        favoriteProducts: List.generate(
          5,
          (index) => WishlistProductEntity.mockData(),
        ),
      ),
    );

    final favoriteProducts = await FavoriteLocalStorage.getFavoriteProducts();

    emit(
      WishlistState(
        stateStatus: AppStateStatus.successLoaded,
        favoriteProducts: favoriteProducts,
      ),
    );
  }

  Future<void> _onAddRemoveToWishlistEvent(
    AddRemoveFavoriteProductEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(WishlistState(stateStatus: AppStateStatus.loadingBody));

    var response = await FavoriteLocalStorage.addRemoveFavoriteProduct(
      productData: event.productData,
    );

    if (response is DataSuccess) {
      emit(WishlistState(stateStatus: AppStateStatus.successSubmit));
    } else {
      emit(
        WishlistState(
          stateStatus: AppStateStatus.error,
          error: AddRemoveToFavoriteFailed(),
        ),
      );
    }
  }
}
