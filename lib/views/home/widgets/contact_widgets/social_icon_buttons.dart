import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/extensions/context_extensions.dart';

class SocialIconsButton extends StatefulWidget {
  const SocialIconsButton({
    super.key,
    this.iconData,
    this.isLeetCode,
  });

  final IconData? iconData;
  final bool? isLeetCode;

  @override
  State<SocialIconsButton> createState() => _SocialIconsButtonState();
}

class _SocialIconsButtonState extends State<SocialIconsButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    bool isLeetCode = widget.isLeetCode ?? false;
    final theme = Theme.of(context);
    final onHover = isHovering ? theme.colorScheme.secondary : Colors.white;
    final isMobile = context.isMobile;

    return MouseRegion(
      onEnter: (event) => setState(() => isHovering = true),
      onExit: (event) => setState(() => isHovering = false),
      opaque: true,
      child: isLeetCode
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Leet ",
                  style: TextStyle(
                    fontSize: isMobile ? 30 : 50,
                    color: onHover,
                  ),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  widget.iconData,
                  size: isMobile ? 25 : 50,
                  color: onHover,
                ),
              ],
            )
          : Icon(
              widget.iconData,
              size: isMobile ? 25 : 50,
              color: onHover,
            ),
    );
  }
}
