import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renmoney_test/utils/constants/app_assets.dart';

/// Use SvgAsset.iconName to specify the svg icon
class ReusableSvgImage extends StatelessWidget {
  final SvgData svgIcon;
  final Color? color;
  final double? size;

  const ReusableSvgImage({
    Key? key,
    required this.svgIcon,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgIcon.data,
      color: color,
      height: size,
    );
  }
}
