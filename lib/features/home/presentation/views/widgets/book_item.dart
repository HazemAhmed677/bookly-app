import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, this.flag, required this.imageURL});
  final bool? flag;
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: (flag != null)
          ? BorderRadius.circular(12)
          : BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: imageURL,
        fit: BoxFit.fill,
      ),
    );
  }
}
