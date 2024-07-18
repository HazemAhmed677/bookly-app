import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class FeaturedListOfItems extends StatelessWidget {
  const FeaturedListOfItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.width;
    return SizedBox(
      height: hight * .6,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: ListView.builder(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) => Container(
            margin: (index < 3)
                ? const EdgeInsets.only(right: 16)
                : const EdgeInsets.only(right: 30),
            width: width * .4,
            child: const BookItem(),
          ),
        ),
      ),
    );
  }
}
