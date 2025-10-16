import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.pageHorizontalPadding.w,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(AppImages.welcomeBgImg).image,
          ),
        ),
        child: SizedBox(
          height: .55.sh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.brandingImg, height: 58.h, width: 58.h),
              4.h.heightSpace,
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Fake Store",
                  style: GoogleFonts.urbanist(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppStyles.almostBlack,
                  ),
                ),
              ),
              24.h.heightSpace,

              ElevatedButton(
                onPressed: () {
                  context.goNamed(AppRoutes.loginPage);
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
