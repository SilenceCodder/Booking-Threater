import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppColor {
  static const Color launchColor1 = const Color(0xFFFB5484);
  static const Color launchColor2 = const Color(0xFF0C0B09);
  static const Color launchColor3 = const Color(0xFFA21933);
  static const Color textColor  = const Color(0xFFEDF0F2);
  static const Color loginGradientStart = const Color(0xFFfbab66);
  static const Color loginGradientEnd = const Color(0xFFf7418c);
  static const Color loginStart = const Color(0xFFDD028A); // CB027A
  static const Color loginEnd = const Color(0xFF63013C);
  static const Color primaryColor = const Color(0xFF63013C);
  static const Color secondaryColor  = const Color(0xFFCB2017);
  static const Color secondaryLightColor  = const Color(0xFFfc046);
  static const Color backgroundColor  = const Color(0xFFFbcaaa4);
  static const Color surface  = const Color(0xFFD1D1D1);
  static const Color primaryDarkColor  = const Color(0xFF5f4339);
  static const Color erroColor  = const Color(0xFF8d6e63);
  static const Color alternativebackground  = const Color(0x66FFFFFF);
  static const Color d  = const Color(0xFF940026);
  static const Color  con = const Color(0xFFEEE1E9);

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);

  static const primaryGradient = const LinearGradient(
    colors: const [loginStart, loginEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}


class AppImage{
  static const String launchImage1 = 'assets/images/cinema.jpg';
  static const String launchImage2 = 'assets/images/seates.jpg';
  static const String launchImage3 = 'assets/images/movietheater.jpg';
}

class AppTextStyles {
  // For snackbar/Toast text
  static TextStyle snackbar(BuildContext context) {
    return TextStyle(
        fontFamily: "Metropolis",
        fontFamilyFallback: ["RobotoRegular"],
        fontSize: AppFontSizes.small,
        fontWeight: FontWeight.w700,
        color: AppColor.loginGradientEnd);
  }

  // For headers
  static TextStyle header(BuildContext context) {
    return TextStyle(
        fontFamily: "Metropolis",
        fontFamilyFallback: ["RobotoRegular"],
        fontSize: AppFontSizes.largest,
        fontWeight: FontWeight.w700,
        color: AppColor.loginGradientEnd);
  }

  // For small headers
  static TextStyle editTextSmall(BuildContext context) {
    return TextStyle(
        fontFamily: "Metropolis",
        fontFamilyFallback: ["Lobster"],
        fontSize: AppFontSizes.medium,
        fontWeight: FontWeight.w500,
        color: AppColor.loginGradientEnd);
  }
  static TextStyle error(BuildContext context) {
    return TextStyle(
        fontFamily: "Metropolis",
        fontFamilyFallback: ["Lobster"],
        fontSize: AppFontSizes.medium,
        fontWeight: FontWeight.w800,
        color: AppColor.loginGradientEnd);
  }
  static TextStyle help(BuildContext context) {
    return TextStyle(
        fontFamily: "Metropolis",
        fontFamilyFallback: ["Lobster"],
        fontSize: AppFontSizes.medium,
        fontWeight: FontWeight.w800,
        color: AppColor.loginGradientEnd);
  }
  static TextStyle siginText(BuildContext context) {
    return TextStyle(
        fontFamily: "Metropolis",
        fontFamilyFallback: ["Lobster"],
        fontSize: 14.0,
        fontWeight: FontWeight.w800,
        color: AppColor.loginGradientEnd);

  }

  static TextStyle headerSmall(BuildContext context) {
    return TextStyle(
        fontFamily: "Metropolis",
        fontFamilyFallback: ["RobotoRegular"],
        fontSize: AppFontSizes.medium,
        fontWeight: FontWeight.w500,
        color: AppColor.loginGradientEnd);
  }
  static TextStyle headerSmallWhite(BuildContext context) {
    return TextStyle(
        fontFamily: "Metropolis",
        fontFamilyFallback: ["RobotoRegular"],
        fontSize: AppFontSizes.medium,
        fontWeight: FontWeight.w500,
        color: AppColor.loginGradientEnd);
  }

  static TextStyle headerSmall2(BuildContext context) {
    return TextStyle(
        fontFamily: "Metropolis",
        fontFamilyFallback: ["RobotoRegular"],
        fontSize: AppFontSizes.medium,
        fontWeight: FontWeight.w700,
        color: AppColor.loginGradientEnd);
  }

  static TextStyle inputStyle(BuildContext context) {
    return TextStyle(
        fontFamily: "Metropolis",
        fontFamilyFallback: ["RobotoRegular"],
        fontSize: AppFontSizes.small,
        fontWeight: FontWeight.w500,
        color: AppColor.textColor);
  }
}

class AppFontSizes {
  static const smallest = 12.0;
  static const small = 14.0;
  static const medium = 16.0;
  static const large = 18.0;
  static const larger = 24.0;
  static const largest = 28.0;
}