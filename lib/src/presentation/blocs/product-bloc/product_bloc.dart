import 'package:equatable/equatable.dart';
import 'package:fake_store/service_locator.dart';
import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc()
    : _getProductsUsecase = serviceLocator<GetProducts>(),

      super(const ProductState(stateStatus: AppStateStatus.initial)) {
    on<GetProductsEvent>(_onGetProducts);
  }

  final GetProducts _getProductsUsecase;

  Future<void> _onGetProducts(
    GetProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(
      state.copyWith(
        stateStatus: AppStateStatus.loadingBody,
        products: List.generate(5, (index)=>ProductEntity.mockData()),
      ),
    );

    final productsResponse = await _getProductsUsecase();

    if (productsResponse is DataSuccess) {
      var products =
          productsResponse.data!
              .map(
                (productRespose) =>
                    ProductEntity.fromResponse(response: productRespose),
              )
              .toList();
      emit(
        ProductState(
          stateStatus: AppStateStatus.successLoaded,
          products: products,
        ),
      );
    } else {
      emit(
        state.copyWith(
          stateStatus: AppStateStatus.error,
          error: GetProductsFailed(),
        ),
      );
    }
  }
}
