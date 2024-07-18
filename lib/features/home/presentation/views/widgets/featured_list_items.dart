import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

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
        child: ListView.builder(
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
        ),
      ),
    );
  }
}
