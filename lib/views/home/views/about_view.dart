import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:flutter/material.dart';
import '../../../utils/animations/pointer_animation.dart';
import '../../../utils/extensions/context_extensions.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = context.isMobile;
    final title =
        "Having a strong passion for -opensource work ${!isMobile ? "\nand building quality-mobile applications" : "and building quality-mobile applications"}";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 100,
      children: [
        _buildAboutSection(theme, context, isMobile),
        _buildAboutTitle(isMobile, theme, title),
        PointerAnimation(color: theme.colorScheme.secondary),
        _buildQuote(theme, isMobile),
      ],
    );
  }

  Widget _buildAboutSection(
    ThemeData theme,
    BuildContext context,
    bool isMobile,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        spacing: 20,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAboutSectionTitle(
                theme: theme,
                isMobile: isMobile,
                text: "A lit'le about myself.",
              ),
              Spacer(),
              _buildAboutSectionContent(
                theme: theme,
                isMobile: isMobile,
                text:
                    "Hi, I'm Kishore Kumar S, a Flutter developer who's been building apps for over a year. "
                    "I love turning ideas into reality using Flutter — it's like magic for creating apps with passion, dedication and a carefullly curated selection of open-source wisdom. "
                    "I've sent more API requests than texts to my friends. "
                    "State Management? Still in debate if Provider or GetX is my true friend. "
                    "Then, why to reinvent the wheel when I can fine-tune it with Stack-Overflow and GitHub? 🚀",
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAboutSectionTitle(
                theme: theme,
                isMobile: isMobile,
                text: "Edu-cation",
              ),
              Spacer(),
              _buildAboutSectionContent(
                theme: theme,
                isMobile: isMobile,
                text:
                    "I completed my schooling at Holy Cross Matriculation Higher Secondary School, Salem, Tamil Nadu ${isMobile ? "🏫" : ""},   "
                    "specializing in Physics, Chemistry, Mathematics, and Computer Science. "
                    "I then earned a Bachelor's degree in Computer Science and Engineering "
                    "from K.S. Rangasamy College of Technology, Thiruchengodu, Namakkal, Tamil Nadu ${isMobile ? "🎓" : ""}, "
                    "Over the years, I absorbed knowledge in classrooms and memorized equations, "
                    "but let's be honest – Googling and contributing to open-source projects "
                    "deserve honorary mentions on my resume. 📃",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSectionContent({
    required ThemeData theme,
    required bool isMobile,
    required String text,
  }) {
    return Expanded(
      flex: 3,
      child: AutoSizeText(
        text,
        maxLines: 50,
        minFontSize: 12,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        maxFontSize: 20,
        style:
            theme.textTheme.bodyLarge?.copyWith(fontSize: isMobile ? 15 : 20),
      ),
    );
  }

  Widget _buildAboutSectionTitle({
    required ThemeData theme,
    required bool isMobile,
    required String text,
  }) {
    return Expanded(
      flex: 1,
      child: Text(
        text,
        style: theme.textTheme.titleLarge?.copyWith(
          fontSize: isMobile ? 18 : 50,
          color: theme.colorScheme.secondary,
        ),
      ),
    );
  }

  Widget _buildQuote(ThemeData theme, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AutoSizeText(
                  "I am not a genius. ",
                  textAlign: isMobile ? TextAlign.center : null,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: isMobile ? 25 : 50,
                    color: theme.colorScheme.secondary,
                  ),
                  minFontSize: 20,
                  maxFontSize: 50,
                  maxLines: 4,
                ),
              ),
              Flexible(
                child: AutoSizeText(
                  "I am only passionately curious.",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: isMobile ? 25 : 50,
                  ),
                  softWrap: true,
                  wrapWords: true,
                  minFontSize: 20,
                  maxFontSize: 50,
                  maxLines: 4,
                ),
              ),
            ],
          ),
          AutoSizeText(
            "- Richard Feynman ${!isMobile ? ", an American theoretical physicist" : ""}",
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget _buildAboutTitle(bool isMobile, ThemeData theme, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 16 : 0),
      child: AutoSizeText(
        text,
        maxLines: 5,
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontSize: isMobile ? 25 : 50,
        ),
      ),
    );
  }
}
