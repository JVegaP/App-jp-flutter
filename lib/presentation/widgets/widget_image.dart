import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jp_app_flutter/core/constants/color_constants.dart';
import 'package:jp_app_flutter/core/constants/style_constants.dart';

/// Class that create a image widget customizable
class WidgetImage extends StatelessWidget {
  final BoxFit boxFit;
  final Color? color;
  final String image;
  final double height;
  final double width;

  const WidgetImage({
    required Key key,
    required this.image,
    this.boxFit = BoxFit.cover,
    this.color,
    this.height = kDimens20,
    this.width = kDimens20
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      key: key,
      image,
      colorFilter: color == null ? null : ColorFilter.mode(color ?? kPrimary, BlendMode.srcIn),
      fit: boxFit,
      height: height,
      width: width,
    );
  }
}