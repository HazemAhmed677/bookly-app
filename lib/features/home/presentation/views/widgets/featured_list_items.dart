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
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => Container(
                  margin: (index < 5)
                      ? const EdgeInsets.only(right: 16)
                      : const EdgeInsets.only(right: 30),
                  width: (flag != null) ? width * 0.18 : width * .4,
                  child: BookItem(
                    flag: flag,
                  ),
                ),
              );
            } else if (state is FetchFeaturedBooksFailure) {
              return Text(state.errorMsg);
            } else {
              return Text('f');
            }
          },
        ),
      ),
    );
  }
}
