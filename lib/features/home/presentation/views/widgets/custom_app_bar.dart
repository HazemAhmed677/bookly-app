import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsData.logo,
          height: 30,
          width: 75,
        ),
        const Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(38),
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.only(top: 4.0, left: 4),
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
