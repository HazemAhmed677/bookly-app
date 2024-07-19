import 'package:bookly_app/features/home/presentation/manager/fetch_newest_books.dart/fetch_newest_books_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({
    super.key,
  });

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  bool isPushing = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubitCubit, FetchNewestBooksCubitState>(
      builder: (context, state) {
        if (state is FetchNewestBooksCubitLoading) {
          return const SliverToBoxAdapter(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        } else if (state is FetchNewestBooksCubitSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 10,
            ),
            sliver: SliverList.builder(
              itemCount: 8,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () async {
                    if (isPushing) {
                      return;
                    }
                    setState(() {
                      isPushing = true;
                    });
                    await context.push('/bookDetails');
                    setState(() {
                      isPushing = false;
                    });
                  },
                  child: const NewestItem(),
                ),
              ),
            ),
          );
        } else if (state is FetchNewestBooksCubitFailuire) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 30),
            child: SliverToBoxAdapter(child: Text(state.errorMsg)),
          );
        } else {
          return const SliverToBoxAdapter(child: Text(''));
        }
      },
    );
  }
}
