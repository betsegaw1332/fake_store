import 'package:fake_store/service_locator.dart';
import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/data/data.dart';
import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/presentation/presentation.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: AppRoutes.rootRouteName,

        redirect: (context, state) {
          final isLoggedIn =
              SharedPrefService().getBool(AppConstants.isLoggedInKey) ?? false;

          return state.namedLocation(
            isLoggedIn ? AppRoutes.homepage : AppRoutes.welcomePage,
          );
        },
      ),
      GoRoute(
        path: '/welcome-page',
        name: AppRoutes.welcomePage,
        pageBuilder:
            (context, state) => const MaterialPage<void>(child: WelcomePage()),

        routes: [
          GoRoute(
            path: 'login-page',
            name: AppRoutes.loginPage,
            pageBuilder:
                (context, state) =>
                    const MaterialPage<void>(child: LoginPage()),
          ),
        ],
      ),

      GoRoute(
        path: '/home-page',
        name: AppRoutes.homepage,

        pageBuilder:
            (context, state) => const MaterialPage<void>(child: HomePage()),

        routes: [
          GoRoute(
            path: 'product-detail-page',
            name: AppRoutes.productDetailPage,
            pageBuilder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              final isFavorite = data["isFavorite"];
              final productData = data["productData"];
              return MaterialPage<void>(
                child: ProductDetailPage(
                  productData: productData,
                  isFavorite: isFavorite,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
