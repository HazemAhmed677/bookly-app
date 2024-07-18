import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isPushing = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 30,
            width: 75,
          ),
          const Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(38),
            onTap: () async {
              if (isPushing) {
                return;
              }
              setState(
                () {
                  isPushing = true;
                },
              );
              await context.push('/searchView');
              setState(
                () {
                  isPushing = false;
                },
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 4.0, left: 4),
              child: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
