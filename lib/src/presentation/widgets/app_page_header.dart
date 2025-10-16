import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/presentation/presentation.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AppPageHeader extends StatelessWidget {
  const AppPageHeader({super.key, required this.headerText});

  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerText,
          style: GoogleFonts.urbanist(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),

        Column(
          children: [
            GestureDetector(
              onTap: () {
                context.read<AuthBloc>().add(LogoutEvent());
                context.goNamed(AppRoutes.loginPage);
              },
              child: Container(
                height: 32.h,
                width: 32.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppStyles.peachYellow,
                ),
                child: Center(child: Icon(Icons.logout, size: 20)),
              ),
            ),
            Text(
              "Log out",
              style: GoogleFonts.urbanist(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
