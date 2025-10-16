import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/presentation/presentation.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productData;
  final bool isFavorite;
  const ProductCard({
    super.key,
    required this.productData,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppStyles.itemCardBg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20.w,
        children: [
          Container(
            height: 55.h,
            width: 55.h,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(productData.image).image,
              ),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        productData.title,
                        maxLines: 2,
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<FavoriteBloc>().add(
                          AddRemoveFavoriteProductEvent(
                            productData:
                                FavoriteProductEntity.fromProductEntity(
                                  productData: productData,
                                ),
                          ),
                        );
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color:
                            isFavorite ? Colors.red : AppStyles.lightMediumGray,
                      ),
                    ),
                  ],
                ),
                Text(
                  productData.category,
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppStyles.gray,
                  ),
                ),

                Row(
                  children: [
                    Icon(Icons.star, size: 12),
                    Text(
                      '${productData.rate.rate}',
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$${productData.price}",
                  style: GoogleFonts.urbanist(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppStyles.gray,
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
