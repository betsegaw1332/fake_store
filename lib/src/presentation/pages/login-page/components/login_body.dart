import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/presentation/presentation.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _validateLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        UserSignInEvent(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      spacing: 13.h,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              height: 35.h,
              width: 35.h,
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppStyles.lightGray),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Icon(Icons.keyboard_arrow_left, size: 27),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            "Welcome back! Glad\nto see you, Again!",
            style: GoogleFonts.urbanist(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12.h,
            children: [
              AppTextField(
                hintText: "Enter your username",
                controller: _usernameController,
              ),
              AppTextField(
                hintText: "Enter your username",
                isPassword: true,
                controller: _passwordController,
              ),
              5.h.heightSpace,

              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, authState) {
                  if (authState.error != null &&
                      authState.error is UserSigninFailed) {
                    HelperFunctions.showAppSnackBar(
                      context,
                      authState.error!.message!,
                      backgroundColor: Colors.red,
                    );
                  } else if (authState.stateStatus ==
                      AppStateStatus.successSubmit) {
                    // context.read<ProductBloc>().add(GetProductsEvent());
                    context.goNamed(AppRoutes.homepage);
                  }
                },
                builder: (context, authState) {
                  return ElevatedButton(
                    onPressed: _validateLogin,
                    child:
                        authState.stateStatus == AppStateStatus.loadingBody
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
                              "Login",
                              style: GoogleFonts.urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
