import 'package:flutter/material.dart';
import '../utils/extensions/context_extensions.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.theme,
    required this.context,
    required this.text,
  });

  final ThemeData theme;
  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: text,
              style: theme.textTheme.titleMedium!.copyWith(
                fontSize: context.isMobile ? 16.0 : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
