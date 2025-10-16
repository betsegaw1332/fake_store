import 'package:fake_store/src/presentation/presentation.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishlistTabBody extends StatelessWidget {
  const WishlistTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.pageHorizontalPadding,
          ),
          child: AppPageHeader(headerText: "Wishlist"),
        ),
        20.h.heightSpace,

        BlocConsumer<WishlistBloc, WishlistState>(
          listener: (context, favoriteState) {
            if (favoriteState.stateStatus == AppStateStatus.successSubmit) {
              context.read<WishlistBloc>().add(GetFavoriteProductsEvent());
            }
          },
          builder: (context, favoriteState) {
            if (favoriteState.stateStatus == AppStateStatus.successLoaded &&
                favoriteState.favoriteProducts.isEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<WishlistBloc>().add(GetFavoriteProductsEvent());
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: .7.sh,
                    child: Center(
                      child: Text(
                        "Empty Whishlist",
                        style: GoogleFonts.urbanist(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              );
            }
            return BlocConsumer<CartBloc, CartState>(
              listener: (context, cartState) {
                if (cartState.error != null &&
                    cartState.error is AddToCartFailed) {
                  HelperFunctions.showAppSnackBar(
                    context,
                    cartState.error!.message!,
                    backgroundColor: Colors.red,
                  );
                } else if (cartState.stateStatus ==
                    AppStateStatus.successSubmit) {
                  HelperFunctions.showAppSnackBar(
                    context,
                    "Product added to cart",
                    backgroundColor: Colors.green,
                  );
                }
              },
              builder: (context, cartState) {
                return Expanded(
                  child: Skeletonizer(
                    enabled:
                        favoriteState.stateStatus == AppStateStatus.loadingBody,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<CartBloc>().add(GetCartItemsEvent());
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ListView.separated(
                            padding: EdgeInsets.only(bottom: 80.h),
                            itemCount: favoriteState.favoriteProducts.length,
                            itemBuilder: (context, index) {
                              final productData =
                                  favoriteState.favoriteProducts[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: AppConstants.pageHorizontalPadding,
                                  right: AppConstants.pageHorizontalPadding,
                                ),
                                child: WishListCard(
                                  favoriteProductData: productData,
                                ),
                              );
                            },
                            separatorBuilder:
                                (context, index) => 15.h.heightSpace,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
