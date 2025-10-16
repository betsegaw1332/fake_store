import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/presentation/presentation.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCard extends StatelessWidget {
  final CartItemEntity cartData;
  const CartCard({super.key, required this.cartData});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        Container(
          height: 55.h,
          width: 55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(cartData.imageUrl).image,
            ),
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                cartData.title,
                maxLines: 2,
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),

              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<CartBloc>().add(
                        UpdateProductQuantityEvent(
                          productID: cartData.id,
                          newQuantity: cartData.quantity - 1,
                        ),
                      );
                    },
                    child: Container(
                      height: 28.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppStyles.lightMediumGray),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                        ),
                      ),

                      child: Icon(Icons.do_not_disturb_on_outlined),
                    ),
                  ),
                  Container(
                    height: 28.h,
                    width: 40.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: AppStyles.lightMediumGray,
                        ),
                      ),
                    ),

                    child: Text(
                      cartData.quantity.toString(),
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<CartBloc>().add(
                        UpdateProductQuantityEvent(
                          productID: cartData.id,
                          newQuantity: cartData.quantity + 1,
                        ),
                      );
                    },
                    child: Container(
                      height: 28.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppStyles.lightMediumGray),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                      ),

                      child: Icon(Icons.add_circle_outline),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          "\$${cartData.price * cartData.quantity}",
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
