import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunrise_cafe/utils/constants.dart';

class AddCartWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const AddCartWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 32,
        width: 72,
        decoration: BoxDecoration(
          color: ColorConstants.addCartIconColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFDDDDE0).withOpacity(0.9),
              offset: const Offset(5, 5),
              blurRadius: 13,
            ),
            BoxShadow(
              color: const Color(0xFFFFFFFF).withOpacity(0.9),
              offset: const Offset(-5, -5),
              blurRadius: 10,
            ),
            BoxShadow(
              color: const Color(0x33DDDDE0)
                  .withOpacity(0.2), // Transparency of 20%
              offset: const Offset(5, -5),
              blurRadius: 10,
            ),
            BoxShadow(
              color: const Color(0x33DDDDE0)
                  .withOpacity(0.2), // Transparency of 20%
              offset: const Offset(-5, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF1F1F1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Color(0xFFF1F1F1),
                          Color(0xFFE5E5E5),
                        ],
                        stops: [0.8, 1.0],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xE5DEDEDE),
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                        BoxShadow(
                          color: Color(0xE5FFFFFF),
                          offset: Offset(-2, -2),
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: Color(0x33DEDEDE),
                          offset: Offset(2, -2),
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: Color(0x33DEDEDE),
                          offset: Offset(-2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(AssetConstants.addIcon),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Add",
                style: TextStyleConstants.greyText13W500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
