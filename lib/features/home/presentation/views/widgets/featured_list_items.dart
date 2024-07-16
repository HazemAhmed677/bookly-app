import 'package:bookly_app/core/utils/assets.dart';
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
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) => SizedBox(
            width: width * .44,
            child: AspectRatio(
              aspectRatio: 2 / 4,
              child: Container(
                margin: (index == 3) ? const EdgeInsets.only(right: 30) : null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(AssetsData.testImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
