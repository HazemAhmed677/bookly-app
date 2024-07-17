import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
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
      name: 'bookDetailsView',
      path: '/bookDetails',
      pageBuilder: (context, state) => CustommTransitionPage(
        duration: 200,
        key: state.pageKey,
        child: const BookDetailsView(),
      ),
    ),
    // GoRoute(
    //   path: '/bookDetails',
    //   builder: (context,state)=> const SearchView(),
    // ),
  ]);
}

class CustommTransitionPage extends CustomTransitionPage<void> {
  CustommTransitionPage(
      {required LocalKey super.key,
      required super.child,
      required int duration})
      : super(
          transitionDuration: Duration(milliseconds: duration),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
