import 'package:bookly_app/features/home/presentation/manager/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListOfItems extends StatelessWidget {
  const FeaturedListOfItems({super.key, this.flag});
  final bool? flag;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.width;
    return SizedBox(
      height: (flag != null) ? hight * .3 : hight * .6,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: BlocBuilder<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
          builder: (context, state) {
            if (state is FetchFeaturedBooksLoading) {
              return const Center(
                child: CircularProgressIndicator(),
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
                  width: (flag != null) ? width * 0.18 : width * .4,
                  child: BookItem(
                    imageURL:
                        state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                    flag: flag,
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
