import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/core/widgets/customm_transition_page.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/manager/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_app/features/search/presentation/manager/fetch_search_books_cubit/fetch_search_books_cubit_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static const String kBookDetails = '/bookDetails';
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/homeView',
      pageBuilder: (context, state) => CustommTransitionPage(
        duration: 300,
        key: state.pageKey,
        child: const HomeView(),
      ),
    ),
    GoRoute(
      path: kBookDetails,
      pageBuilder: (context, state) => CustommTransitionPage(
        duration: 200,
        key: state.pageKey,
        child: BlocProvider(
          create: (context) =>
              FetchSimilarBooksCubit(homeRepoImpl: getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
    ),
    GoRoute(
      path: '/searchView',
      pageBuilder: (context, state) => CustommTransitionPage(
        duration: 200,
        key: state.pageKey,
        child: BlocProvider(
          create: (context) => FetchSearchBooksCubitCubit(
            searchRepoImpl: getIt.get<SearchRepoImpl>(),
          ),
          child: const SearchView(),
        ),
      ),
    ),
  ]);
}
