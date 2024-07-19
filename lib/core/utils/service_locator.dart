import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
}
