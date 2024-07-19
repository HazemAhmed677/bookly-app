import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_feedback.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/one_from_authers.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';

class NewestItem extends StatelessWidget {
  const NewestItem({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: hight * 0.16,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 2.7 / 4,
              child: CachedNetworkImage(
                imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail!,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30),
          width: width * 0.50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bookModel.volumeInfo!.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle20,
              ),
              OneFromAuthors(bookModel: bookModel, index: 0),
              (bookModel.volumeInfo!.authors!.length > 1)
                  ? OneFromAuthors(bookModel: bookModel, index: 1)
                  : (bookModel.volumeInfo!.authors!.length > 2)
                      ? OneFromAuthors(bookModel: bookModel, index: 2)
                      : (bookModel.volumeInfo!.authors!.length > 3)
                          ? OneFromAuthors(bookModel: bookModel, index: 3)
                          : const SizedBox(),
              Row(
                children: [
                  Text(
                    'Free',
                    style: Styles.textStyleForPrice.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: kMotserraRegular,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const CustomFeedBack()
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
