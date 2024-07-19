import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/manager/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/fetch_newest_books.dart/fetch_newest_books_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // but this is not valid, using 2 objects of HomeRepoImpl and 2 of ApiService
    // so debendency injection principle solves this problem
    // it's just using sengleton patter
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchFeaturedBooksCubit(
            homeRepoImpl: HomeRepoImpl(apiService: ApiService(dio: Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => FetchNewestBooksCubitCubit(
            homeRepoImpl: HomeRepoImpl(apiService: ApiService(dio: Dio())),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratAlternatesTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
