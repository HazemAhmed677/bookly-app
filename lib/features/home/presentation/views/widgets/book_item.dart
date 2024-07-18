import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, this.flag});
  final bool? flag;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 3.8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: (flag != null)
              ? BorderRadius.circular(12)
              : BorderRadius.circular(20),
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage(AssetsData.testImage),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
