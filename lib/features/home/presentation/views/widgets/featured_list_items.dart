import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/shimmer_loading.dart';
import 'package:bookly_app/features/home/presentation/manager/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class FeaturedListOfItems extends StatelessWidget {
  const FeaturedListOfItems({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.width;
    return SizedBox(
      height: hight * .6,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: BlocBuilder<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
          builder: (context, state) {
            if (state is FetchFeaturedBooksLoading) {
              //*********************** */
              // shimmmer widget
              return const Center(
                child: ShimmerLoading(
                  widthArea: 0.4,
                  hightArea: 0.2,
                ),
              );
            } else if (state is FetchFeaturedBooksSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) => Container(
                  margin: (index < (state.books.length - 1))
                      ? const EdgeInsets.only(right: 16)
                      : const EdgeInsets.only(right: 30),
                  width: width * .4,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetails,
                          extra: state.books[index]);
                    },
                    child: BookItem(
                      imageURL:
                          state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                    ),
                  ),
                ),
              );
            } else if (state is FetchFeaturedBooksFailure) {
              return Text(state.errorMsg);
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
}
