//assets constants

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetConstants {
  static String recordVoiceIcon = "assets/svgs/record_voice_icon.svg";
  static String tagIcon = "assets/svgs/tag_icon.svg";
  static String addIcon = "assets/svgs/add_icon.svg";
  static String subIcon = "assets/svgs/sub_icon.svg";
  static String upArrowIcon = "assets/svgs/up_arrow_icon.svg";
  static String vegIcon = "assets/svgs/veg_icon.svg";
  static String boltIcon = "assets/svgs/bolt_icon.svg";
  static String bookOpenIcon = "assets/svgs/book_open_icon.svg";
  static String shoppingBagIcon = "assets/svgs/shopping_bag_icon.svg";
  static String arrowLeftIcon = "assets/svgs/arrow_left_icon.svg";
  static String waiterIcon = "assets/svgs/waiter_icon.svg";
  static String downArrowIcon = "assets/svgs/down_arrow_icon.svg";
  static String arrowRightWhiteIcon = "assets/svgs/arrow_right_white_icon.svg";
}

// Color Constants

class ColorConstants {
  static Color primaryWhite = const Color(0xffF1F1F1);
  static Color shadowGrey = const Color(0xFFAEAEC0);
  static Color shadowWhite = const Color(0xFFFFFFFF);
  static Color addCartIconColor = const Color(0xffF0F0F3);
  static Color greyText = const Color(0xff4A5662);
  static Color tabGreen = const Color(0xff3CBCB4);
  static Color cookingInstructionColor = const Color(0xff76DFE5);
  static Color tomatoRed = const Color(0xffEF4B4B);
}

//TextStyleConstants

class TextStyleConstants {
  static TextStyle greyText13W500 = GoogleFonts.ubuntu(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: ColorConstants.greyText,
  );

  static TextStyle white13W700 = GoogleFonts.ubuntu(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle greyText16W500 = GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorConstants.greyText,
  );

  static TextStyle greyText16W700 = GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorConstants.greyText,
  );

  static TextStyle white16W500 = GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle greyText14W500 = GoogleFonts.ubuntu(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ColorConstants.greyText,
  );

  static TextStyle greyText20W500 = GoogleFonts.ubuntu(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: ColorConstants.greyText,
  );

  static TextStyle cookingInstruction12W500 = GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: ColorConstants.cookingInstructionColor,
  );

  static TextStyle white12W500 = GoogleFonts.ubuntu(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle white10W500 = GoogleFonts.ubuntu(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

// String Constants

class StringConstants {
  static String cafeName = "Sunrise Cafe";
  static String special = "Special";
  static String main = "Main";
  static String desserts = "Desserts";
  static String beverages = "Beverages";
}
