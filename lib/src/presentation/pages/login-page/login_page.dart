import 'package:fake_store/src/presentation/pages/login-page/components/login_body.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.pageHorizontalPadding,
          ),
          child: LoginBody(),
        ),
      ),
    );
  }
}
