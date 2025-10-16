import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/presentation/presentation.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
    required this.productData,
    required this.isFavorite,
  });

  final ProductEntity productData;
  final bool isFavorite;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final ValueNotifier<bool> _isFavoriteNotifier = ValueNotifier(false);

  @override
  void initState() {
    _isFavoriteNotifier.value = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.pageHorizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _isFavoriteNotifier,
                    builder: (context, isFavorite, chidl) {
                      return GestureDetector(
                        onTap: () {
                          _isFavoriteNotifier.value =
                              !_isFavoriteNotifier.value;
                          context.read<FavoriteBloc>().add(
                            AddRemoveFavoriteProductEvent(
                              productData:
                                  FavoriteProductEntity.fromProductEntity(
                                    productData: widget.productData,
                                  ),
                            ),
                          );
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color:
                              isFavorite
                                  ? Colors.red
                                  : AppStyles.veryDarkGray,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.pageHorizontalPadding,
                ),
                child: Image.network(
                  widget.productData.image,
                  fit: BoxFit.contain,
                  height: .3.sh,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                spacing: 2,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.pageHorizontalPadding,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productData.title,
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          widget.productData.category,
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppStyles.gray,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, size: 12),
                            Text(
                              '${widget.productData.rate.rate}',
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            4.w.widthSpace,
                            Text(
                              '${widget.productData.rate.count} Reviews',
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppStyles.mediumDarkGray,
                              ),
                            ),
                          ],
                        ),
                        6.h.heightSpace,
                        Text(
                          widget.productData.description,
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppStyles.darkGray,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.pageHorizontalPadding,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(color: AppStyles.peachYellow),
                    child: Row(
                      spacing: 25,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: AppStyles.veryDarkGray,
                              ),
                            ),
                            Text(
                              '\$${widget.productData.price}',
                              style: GoogleFonts.lora(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppStyles.almostBlack,
                              ),
                            ),
                          ],
                        ),
                        BlocConsumer<CartBloc, CartState>(
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
                              child: SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.read<CartBloc>().add(
                                      AddToCartEvent(
                                        productData: widget.productData,
                                      ),
                                    );
                                  },
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
                                            "Add to cart",
                                            style: GoogleFonts.urbanist(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
