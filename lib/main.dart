import 'package:fake_store/service_locator.dart';
import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/data/data.dart';
import 'package:fake_store/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  await serviceLocatorInit();
  final prefs = SharedPrefService();
  await prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator.get<AuthBloc>()),
        BlocProvider(create: (context) => serviceLocator.get<ProductBloc>()),
        BlocProvider(create: (context) => serviceLocator.get<CartBloc>()),
        BlocProvider(
          create:
              (context) =>
                  serviceLocator.get<FavoriteBloc>()
                    ..add(GetFavoriteProductsEvent()),
        ),
      ],
      child: ScreenUtilInit(
        builder: ((context, child) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,

            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
          );
        }),
      ),
    );
  }
}
