import 'package:bookly_app/core/widgets/customm_transition_page.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

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
        child: BookDetailsView(
          bookModel: state.extra as BookModel,
        ),
      ),
    ),
    GoRoute(
      path: '/searchView',
      pageBuilder: (context, state) => CustommTransitionPage(
        duration: 200,
        key: state.pageKey,
        child: const SearchView(),
      ),
    ),
  ]);
}
