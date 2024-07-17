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
        key: state.pageKey,
        child: const HomeView(),
      ),
    ),
    // GoRoute(
    //   path: '/bookDetails',
    //   builder: (context,state)=> const BookDetails(),
    // ),
    // GoRoute(
    //   path: '/bookDetails',
    //   builder: (context,state)=> const SearchView(),
    // ),
  ]);
}

class CustommTransitionPage extends CustomTransitionPage<void> {
  CustommTransitionPage({required LocalKey super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
