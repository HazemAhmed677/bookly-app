import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_feedback.dart';
import 'package:flutter/material.dart';

class NewestItem extends StatelessWidget {
  const NewestItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 110,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                AssetsData.testImage,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30),
          width: width * 0.55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Harry Potter and the Goblet of Fire',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle20,
              ),
              const Opacity(
                opacity: 0.7,
                child: Text(
                  'J.K. Rowling',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14,
                ),
              ),
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
