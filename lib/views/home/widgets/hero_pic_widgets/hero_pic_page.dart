import 'package:flutter/material.dart';
import 'package:personal_portfolio/portfolio_app.dart';
import 'package:personal_portfolio/utils/extensions/context_extensions.dart';

import '../../../../models/hero_pic_model.dart';
import '../../../../providers/indie_model_provider.dart';
import 'blend_mask.dart';

class HeroPicTextClipper extends CustomClipper<Rect> {
  final double y;
  final double height;

  HeroPicTextClipper({this.y = 0, this.height = 0});

  @override
  getClip(Size size) {
    return Rect.fromLTWH(0, height + y, size.width, size.height - height);
  }

  @override
  bool shouldReclip(HeroPicTextClipper oldClipper) {
    return true;
  }
}

class HeroPicPage extends StatelessWidget {
  final String topTitle;
  final String bottomTitle;
  final Color? backgroundColor;
  final ImageProvider image;
  final int pageIndex;
  final double bottomTitleScale;

  final Indie3dModelController controller;

  final double topTitleClipProgress;
  final double bottomTitleClipProgress;
  final double backgroundShapeOpacity;

  const HeroPicPage({
    super.key,
    this.topTitle = "",
    this.bottomTitle = "",
    this.backgroundColor,
    required this.image,
    this.pageIndex = 0,
    required this.controller,
    this.topTitleClipProgress = 0.0,
    this.bottomTitleClipProgress = 0.0,
    this.bottomTitleScale = 1.0,
    this.backgroundShapeOpacity = 0.85,
  });

  @override
  Widget build(context) {
    final appSize = MediaQuery.of(context).size;
    final textScale = appSize.aspectRatio > 1 ? 1.15 : .8;
    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          if (controller.initialized) ...{
            BlendMask(
              blendMode: BlendMode.hardLight,
              opacity: backgroundShapeOpacity,
              child: HeroPicModel(
                controller: controller,
                pageIndex: pageIndex * 2 + 0,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: appSize.height * (appSize.aspectRatio > 1 ? 1 : .80),
                child: Image(fit: BoxFit.fitHeight, image: image),
              ),
            ),
            BlendMask(
              blendMode: BlendMode.exclusion,
              child: HeroPicModel(
                  controller: controller, pageIndex: pageIndex * 2 + 1),
            ),
            Align(
              alignment: Alignment.topRight,
              child: BlendMask(
                blendMode: BlendMode.difference,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 60, 8, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildClippedText(
                        topTitle,
                        topTitleClipProgress,
                        72 * textScale,
                        0,
                        6,
                        1,
                      ),
                      context.isMobile
                          ? _buildClippedText(
                              bottomTitle,
                              bottomTitleClipProgress,
                              80 * textScale * bottomTitleScale,
                              -10,
                              8,
                              .9)
                          : _buildClippedText(
                              bottomTitle,
                              bottomTitleClipProgress,
                              120 * textScale * bottomTitleScale,
                              -10,
                              8,
                              .9),
                    ],
                  ),
                ),
              ),
            ),
            BlendMask(
              opacity: 0.24,
              blendMode: BlendMode.colorDodge,
              child: Image(
                width: appSize.width,
                fit: BoxFit.none,
                image: AssetImage(
                  'assets/images/noise.png',
                ),
              ),
            ),
          } else ...{
            Center(
              child: Text(
                'Loading assets...',
                style: TextStyle(
                  package: PortfolioApp.pkg,
                  letterSpacing: 1.1,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          },
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0x00000000), const Color(0x99000000)],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ClipRect _buildClippedText(
    String text,
    double progress,
    double fontSize,
    double yOffset,
    double spacing,
    double height,
  ) {
    return ClipRect(
      clipper: HeroPicTextClipper(height: progress * fontSize, y: yOffset),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
          package: PortfolioApp.pkg,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: spacing,
          height: height,
          color: Colors.white,
        ),
      ),
    );
  }
}
