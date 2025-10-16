import 'package:equatable/equatable.dart';
import 'package:fake_store/src/config/data_state.dart';
import 'package:fake_store/src/data/data.dart';
import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc()
    : super(const FavoriteState(stateStatus: AppStateStatus.initial)) {
    on<GetFavoriteProductsEvent>(_onGetFavoriteProducts);
    on<AddRemoveFavoriteProductEvent>(_onAddRemoveToFavoriteEvent);
  }

  Future<void> _onGetFavoriteProducts(
    GetFavoriteProductsEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(
      FavoriteState(
        stateStatus: AppStateStatus.loadingBody,
        favoriteProducts: List.generate(
          5,
          (index) => FavoriteProductEntity.mockData(),
        ),
      ),
    );

    final favoriteProducts = await FavoriteLocalStorage.getFavoriteProducts();

    emit(
      FavoriteState(
        stateStatus: AppStateStatus.successLoaded,
        favoriteProducts: favoriteProducts,
      ),
    );
  }

  Future<void> _onAddRemoveToFavoriteEvent(
    AddRemoveFavoriteProductEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(FavoriteState(stateStatus: AppStateStatus.loadingBody));

    var response = await FavoriteLocalStorage.addRemoveFavoriteProduct(
      productData: event.productData,
    );

    if (response is DataSuccess) {
      emit(FavoriteState(stateStatus: AppStateStatus.successSubmit));
    } else {
      emit(
        FavoriteState(
          stateStatus: AppStateStatus.error,
          error: AddRemoveToFavoriteFailed(),
        ),
      );
    }
  }
}
