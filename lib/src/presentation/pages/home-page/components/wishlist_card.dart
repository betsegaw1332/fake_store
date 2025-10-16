import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/presentation/presentation.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListCard extends StatelessWidget {
  final WishlistProductEntity favoriteProductData;
  const WishListCard({super.key, required this.favoriteProductData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppStyles.itemCardBg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 15.w,
        children: [
          Container(
            height: 55.h,
            width: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,

                image: Image.network(favoriteProductData.imageUrl).image,
              ),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              spacing: 5,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        favoriteProductData.title,
                        maxLines: 2,
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<WishlistBloc>().add(
                          AddRemoveFavoriteProductEvent(
                            productData: favoriteProductData,
                          ),
                        );
                      },
                      child: Icon(Icons.favorite, color: Colors.red),
                    ),
                  ],
                ),

                Text(
                  "\$${favoriteProductData.price}",
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppStyles.mediumGray,
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  onPressed: () {
                    context.read<CartBloc>().add(
                      AddToCartEvent(
                        productData: ProductEntity(
                          id: favoriteProductData.id,
                          price: favoriteProductData.price,
                          title: favoriteProductData.title,
                          description: '',
                          category: '',
                          image: favoriteProductData.imageUrl,
                          rate: RatingEntity(count: 0, rate: 0),
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      "Add to cart",
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
