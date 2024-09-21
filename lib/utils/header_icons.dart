import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunrise_cafe/utils/constants.dart';

class HeaderIcon extends StatelessWidget {
  final String assetPath;
  final double? size;
  const HeaderIcon({
    super.key,
    required this.assetPath,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 30,
      width: size ?? 30,
      decoration: BoxDecoration(
        color: ColorConstants.primaryWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: ColorConstants.shadowGrey.withOpacity(0.4),
            offset: const Offset(1.5, 1.5),
            blurRadius: 3,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: ColorConstants.shadowWhite,
            offset: const Offset(-1, -1),
            blurRadius: 3,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SvgPicture.asset(assetPath),
      ),
    );
  }
}
