import 'package:fake_store/src/presentation/presentation.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartTabBody extends StatelessWidget {
  const CartTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.pageHorizontalPadding,
          ),
          child: AppPageHeader(headerText: "Cart"),
        ),
        20.h.heightSpace,

        BlocConsumer<CartBloc, CartState>(
          listener: (context, cartState) {
            if (cartState.error != null &&
                cartState.error is UpdateQuantityFailed) {
              HelperFunctions.showAppSnackBar(
                context,
                cartState.error!.message!,
                backgroundColor: Colors.red,
              );
            } else if (cartState.stateStatus == AppStateStatus.successSubmit) {
              context.read<CartBloc>().add(GetCartItemsEvent());
            }
          },
          builder: (context, cartState) {
            if (cartState.stateStatus == AppStateStatus.successLoaded &&
                cartState.cartItems.isEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<CartBloc>().add(GetCartItemsEvent());
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: .7.sh,
                    child: Center(
                      child: Text(
                        "Your cart is empty",
                        style: GoogleFonts.urbanist(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              );
            }
            return Expanded(
              child: Skeletonizer(
                enabled: cartState.stateStatus == AppStateStatus.loadingBody,
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<CartBloc>().add(GetCartItemsEvent());
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ListView.separated(
                        padding: EdgeInsets.only(bottom: 80.h),
                        itemCount: cartState.cartItems.length,
                        itemBuilder: (context, index) {
                          final cartData = cartState.cartItems[index];
                          return Slidable(
                            key: ValueKey(cartData),

                            endActionPane: ActionPane(
                              motion: const ScrollMotion(), // Slide animation
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    context.read<CartBloc>().add(
                                      RemoveCartItemEvent(
                                        productID: cartData.id,
                                      ),
                                    );
                                  },
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: AppConstants.pageHorizontalPadding,
                                right: AppConstants.pageHorizontalPadding,
                              ),
                              child: CartCard(cartData: cartData),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => 15.h.heightSpace,
                      ),

                      Container(
                        height: 70.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.pageHorizontalPadding,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Row(
                          spacing: 25,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cart total',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: AppStyles.veryDarkGray,
                                  ),
                                ),
                                Text(
                                  '\$${cartState.totalPrice.toStringAsFixed(2)}',
                                  style: GoogleFonts.lora(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: AppStyles.almostBlack,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 48,
                              width: 220.w,
                              child: ElevatedButton(
                                onPressed: () {},
                                child:
                                    cartState.stateStatus ==
                                            AppStateStatus.loadingBody
                                        ? SizedBox(
                                          height: 16.h,
                                          width: 16.h,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                        : Text(
                                          "Checkout",
                                          style: GoogleFonts.urbanist(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
