import 'package:flutter/material.dart';

import '../util/dimensions.dart';
import '../util/styles.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  final bool? transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double radius;
  final IconData? icon;

  CustomButton(
      {this.onPressed,
      required this.buttonText,
      this.transparent = false,
      this.margin,
      this.width,
      this.height,
      this.fontSize,
      this.radius = 5,
      this.icon});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onPressed == null
          ? Theme.of(context).disabledColor
          : transparent == true
              ? Colors.transparent
              : Theme.of(context).primaryColor,
      minimumSize: Size(width ?? Dimensions.WEB_MAX_WIDTH, height ?? 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );

    return Center(
        child: SizedBox(
            width: width ?? Dimensions.WEB_MAX_WIDTH,
            child: Padding(
              padding: margin ?? EdgeInsets.all(0),
              child: TextButton(
                onPressed: onPressed,
                style: _flatButtonStyle,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  icon != null
                      ? Padding(
                          padding: EdgeInsets.only(
                              right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Icon(icon,
                              color: transparent == true
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).cardColor),
                        )
                      : SizedBox(),
                  Text(buttonText ?? '',
                      textAlign: TextAlign.center,
                      style: robotoBold.copyWith(
                        color: transparent == true
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).cardColor,
                        fontSize: fontSize ?? Dimensions.fontSizeLarge,
                      )),
                ]),
              ),
            )));
  }
}
