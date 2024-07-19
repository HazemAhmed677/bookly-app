import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/presentation/manager/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class SuggestedListView extends StatelessWidget {
  const SuggestedListView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.width;
    return SizedBox(
      height: hight * .3,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: BlocBuilder<FetchSimilarBooksCubit, FetchSimilarBooksState>(
          builder: (context, state) {
            if (state is FetchSimilarBooksLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FetchSimilarBooksSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) => Container(
                  margin: (index < (state.books.length - 1))
                      ? const EdgeInsets.only(right: 16)
                      : const EdgeInsets.only(right: 30),
                  width: width * .18,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetails,
                          extra: state.books[index]);
                    },
                    child: BookItem(
                      flag: true,
                      imageURL:
                          state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                    ),
                  ),
                ),
              );
            } else if (state is FetchSimilarBooksFailuire) {
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
