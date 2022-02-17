import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:loja_delicia_das_meninas/features/home/data/datasources/product_remote_data_source.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'core/api/api_interceptor.dart';
import 'core/api/url_creator.dart';
import 'core/device/network_info.dart';
import 'features/highlight/data/datasources/highlight_remote_data_source.dart';
import 'features/highlight/data/repositories/highlight_repository.dart';
import 'features/highlight/domain/repositories/i_highlight_repository.dart';
import 'features/highlight/domain/usecases/get_highlight_use_case.dart';
import 'features/highlight/presentation/bloc/highlight_bloc.dart';
import 'features/home/data/repositories/product_repository.dart';
import 'features/home/domain/repositories/i_product_repository.dart';
import 'features/home/domain/usecases/product_usecase.dart';
import 'features/home/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<IHttpClient>(HttpClient());
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl()));
  sl.registerLazySingleton<IUrlCreator>(() => UrlCreator());
  sl.registerLazySingleton(() => HomeBloc(sl()));
  sl.registerLazySingleton(() => GetProduct(sl()));
  sl.registerLazySingleton<IProductRepository>(() => ProductRepository(sl()));
  sl.registerLazySingleton<IProductRemoteDataSource>(() => ProductRemoteDataSource(sl(), sl(), sl()));

  sl.registerLazySingleton(() => HighLightBloc(sl()));
  sl.registerLazySingleton(() => GetHighLightUseCase(sl()));
  sl.registerLazySingleton<IHighLightRepository>(() => HighLightRepository(sl()));
  sl.registerLazySingleton<IHomeRemoteDataSource>(() => HomeRemoteDataSource(sl(), sl(), sl()));

  await Parse().initialize(
    'bZTSzIYal3FzAcLtuMVclhWMj7lbmGBednBdb2TX',
    'https://parseapi.back4app.com/',
    clientKey: 'gWYvgi25koyiOrq5YWS2UKwamK00LvabmZEj7hJX',
    autoSendSessionId: true,
    debug: true,
  );

  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => http.Client());
  await sl.allReady();
}
