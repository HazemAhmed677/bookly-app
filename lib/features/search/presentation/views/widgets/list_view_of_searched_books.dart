import 'package:bookly_app/core/widgets/shimmer_loading.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_book_item.dart';
import 'package:bookly_app/features/search/presentation/manager/fetch_search_books_cubit/fetch_search_books_cubit_cubit.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class ListViewOfSearchedBooks extends StatefulWidget {
  const ListViewOfSearchedBooks({super.key});

  @override
  State<ListViewOfSearchedBooks> createState() =>
      _ListViewOfSearchedBooksState();
}

class _ListViewOfSearchedBooksState extends State<ListViewOfSearchedBooks> {
  bool isPushing = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSearchBooksCubitCubit, FetchSearchBooksCubitState>(
      builder: (context, state) {
        if (state is FetchSearchBooksCubitSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(
                bottom: 20.0,
                right: 14,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  if (isPushing) {
                    return;
                  }
                  setState(() {
                    isPushing = true;
                  });

                  await GoRouter.of(context)
                      .push('/bookDetails', extra: state.books[index]);
                  setState(() {
                    isPushing = false;
                  });
                },
                child: NewestItem(
                  bookModel: state.books[index],
                ),
              ),
            ),
          );
        } else if (state is FetchSearchBooksCubitFailuire) {
          return Center(child: Text(state.errorMsg));
        } else if (state is FetchSearchBooksCubitLoading) {
          return const ShimmerLoadingForVertical(
            widthArea: 0.1,
            hightArea: 0.2,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
