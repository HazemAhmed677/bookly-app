import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.background,
    required this.textColor,
    required this.text,
    this.onPressed,
  });
  final String text;
  final Color background;
  final Color textColor;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    bool flag = (background == Colors.white);
    return Expanded(
      child: SizedBox(
        height: 50,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: (flag) ? const Radius.circular(14) : Radius.zero,
                bottomLeft: (flag) ? const Radius.circular(14) : Radius.zero,
                topRight: (!flag) ? const Radius.circular(14) : Radius.zero,
                bottomRight: (!flag) ? const Radius.circular(14) : Radius.zero,
              ),
            ),
          ),
          onPressed: onPressed,
          child: (flag)
              ? Text(
                  text,
                  style: Styles.textStyleForPrice.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontFamily: kGiloryMedium,
                      fontSize: 20),
                )
              : Text(
                  text,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: kGiloryMedium,
                    color: textColor,
                  ),
                ),
        ),
      ),
    );
  }
}
