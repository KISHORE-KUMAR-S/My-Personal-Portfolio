import 'package:flutter/material.dart'
    show BuildContext, Paint, PaintingStyle, Theme;

class Constants {
  static const smallDelay = Duration(milliseconds: 1500);
  static const mediumDelay = Duration(milliseconds: 3000);
  static const mediumAnimationSpeed = Duration(milliseconds: 400);

  static const primaryEmail = 'livekishore2001@gmail.com';
  static const secondaryEmail = 'kk2001kishorekumar@gmail.com';
  static const mobileNumber = '+91 7373 10 2828';
  static const linkedIn =
      "https://www.linkedin.com/in/kishore-kumar-s-8b0683201/";
  static const githubProfile = "https://github.com/KISHORE-KUMAR-S";
  static const leetCode = "https://leetcode.com/u/livekishore2001/";
  static const instagram = "https://www.instagram.com/2.k.k.k.1/";
  static const resume =
      "https://drive.google.com/file/d/12ba4jMe_7ZhXgQxkovx-1fZ7MzsQWGQY/view?usp=drivesdk";

  static outlinedText(BuildContext context, {double strokeWidth = 1}) {
    return Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Theme.of(context).colorScheme.secondary;
  }
}
