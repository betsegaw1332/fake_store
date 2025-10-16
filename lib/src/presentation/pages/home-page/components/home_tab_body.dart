import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/data/data.dart';
import 'package:fake_store/src/presentation/presentation.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeTabBody extends StatelessWidget {
  const HomeTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    var prefs = SharedPrefService();
    var userName = prefs.getString(AppConstants.usernameKey);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.pageHorizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPageHeader(headerText: "Welcome,\n$userName"),
          20.h.heightSpace,
          Text(
            "Fake Store",
            style: GoogleFonts.urbanist(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          10.h.heightSpace,
          Expanded(
            child: BlocConsumer<ProductBloc, ProductState>(
              listener: (context, productState) {
                if (productState.error != null &&
                    productState.error is UserSigninFailed) {
                  HelperFunctions.showAppSnackBar(
                    context,
                    productState.error!.message!,
                    backgroundColor: Colors.red,
                  );
                }
              },
              builder: (context, productState) {
                if (productState.error != null) {
                  return FetchErrorWidget(
                    message: productState.error!.message!,
                    onRetry: () {
                      context.read<ProductBloc>().add(GetProductsEvent());
                    },
                  );
                }
                return BlocConsumer<FavoriteBloc, FavoriteState>(
                  listener: (context, favoriteState) {
                    if (favoriteState.stateStatus ==
                        AppStateStatus.successSubmit) {
                      context.read<FavoriteBloc>().add(
                        GetFavoriteProductsEvent(),
                      );
                    }
                  },
                  builder: (context, favoriteState) {
                    return Skeletonizer(
                      enabled:
                          productState.stateStatus ==
                          AppStateStatus.loadingBody,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<ProductBloc>().add(GetProductsEvent());
                        },
                        child: ListView.separated(
                          itemCount: productState.products.length,
                          itemBuilder: (context, index) {
                            final productData = productState.products[index];
                            final isFavorite =
                                favoriteState.favoriteProducts
                                    .where(
                                      (product) => product.id == productData.id,
                                    )
                                    .isNotEmpty;

                            return GestureDetector(
                              onTap: () {
                                context.goNamed(
                                  AppRoutes.productDetailPage,
                                  extra: {
                                    "productData": productData,
                                    "isFavorite": isFavorite,
                                  },
                                );
                              },
                              child: ProductCard(
                                productData: productData,
                                isFavorite: isFavorite,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => 8.h.heightSpace,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
