import 'package:dio/dio.dart';
import 'package:fake_store/src/data/data.dart';
import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/presentation/presentation.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> serviceLocatorInit() async {
  serviceLocator.registerSingleton<Dio>(Dio());

  //datasource services

  serviceLocator.registerFactory<APIAuthService>(
    () => APIAuthService(serviceLocator<Dio>()),
  );
  serviceLocator.registerFactory<APIProductService>(
    () => APIProductService(serviceLocator<Dio>()),
  );


  //repositories
  serviceLocator.registerFactory<APIAuthRepositoryImpl>(
    () => APIAuthRepositoryImpl(),
  );
  serviceLocator.registerFactory<APIProductRepositoryImpl>(
    () => APIProductRepositoryImpl(),
  );

  //usecases
  serviceLocator.registerFactory<SignInUser>(() => SignInUser());
  serviceLocator.registerFactory<GetProducts>(() => GetProducts());

  //blocs

  serviceLocator.registerSingleton<AuthBloc>(AuthBloc());
  serviceLocator.registerSingleton<ProductBloc>(ProductBloc());
  serviceLocator.registerSingleton<CartBloc>(CartBloc());
  serviceLocator.registerSingleton<FavoriteBloc>(FavoriteBloc());
}
