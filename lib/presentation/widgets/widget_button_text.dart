import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/core/constants/color_constants.dart';
import 'package:jp_app_flutter/core/constants/style_constants.dart';
import 'package:jp_app_flutter/core/constants/widget_constants.dart';
import 'package:jp_app_flutter/core/themes/app_theme.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_text_label.dart';

/// Class that create a button text widget customizable
class WidgetButtonText extends StatelessWidget {

  final Border? border;
  final Color? colorBackground;
  final Color? colorBorder;
  final String? icon;
  final bool? isEnabled;
  final bool isLoading;
  final bool hasShadow;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final String text;
  final TextStyle? textStyle;

  const WidgetButtonText({
    this.border,
    this.colorBackground,
    this.colorBorder,
    required Key key,
    this.icon,
    this.isEnabled,
    this.isLoading = false,
    this.hasShadow = false,
    required this.onTap,
    this.padding = const EdgeInsets.all(kDimens0),
    this.text = kDefaultEmptyString,
    this.textStyle,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color shadowColor = hasShadow ? kShadowLight : Colors.transparent;
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: kDimens7,
              color: shadowColor,
              offset: const Offset(kDimens0, kDimens4),
            )
          ]
      ),
      child: RawMaterialButton(
        elevation: kDimens0,
        fillColor: isEnabled ?? true ? colorBackground : colorBackground?.withOpacity(kDimens05),
        onPressed: isEnabled ?? true ? onTap : null,
        padding: padding,
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(kDimens10)),
            side: BorderSide(
                color: colorBorder ?? Colors.transparent,
                width: kDimens1
            )
        ),
        child: Opacity(
          opacity: isEnabled ?? true ? kDimens1 : kDimens05,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading ?
              const SizedBox(
                height: kDimens22,
                width: kDimens22,
                child: CircularProgressIndicator(
                  color: kWhite,
                  strokeWidth: kDimens3,
                ),
              ) : WidgetTextLabel(
                key: const Key(kWidgetTextButton),
                text: text,
                textStyle: textStyle ?? AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
                    fontSize: kDimens15,
                    color: kWhite
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}