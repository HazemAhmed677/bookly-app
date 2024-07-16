import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
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
          width: width * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Harry Potter and the Goblet of fire',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle20,
              ),
              const Text(
                'J.K. Rowling',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14,
              ),
              Row(
                children: [
                  const Text(
                    '19.99 ',
                    style: Styles.textStyleForPrice,
                  ),
                  Text(
                    '€',
                    style: Styles.textStyleForPrice.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    '⭐ 4.8 ',
                    style: Styles.textStyle16,
                  ),
                  Text(
                    '(2390)',
                    style: Styles.textStyle14.copyWith(
                      fontFamily: kMotserraRegular,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
