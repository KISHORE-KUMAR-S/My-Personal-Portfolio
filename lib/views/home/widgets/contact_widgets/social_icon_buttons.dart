import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_portfolio/providers/app_state_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../utils/extensions/context_extensions.dart';

class SocialIconsButton extends StatefulWidget {
  const SocialIconsButton({
    super.key,
    this.iconData,
    this.isLeetCode,
    this.isEmail,
    required this.text,
  });

  final IconData? iconData;
  final bool? isLeetCode, isEmail;
  final String text;

  @override
  State<SocialIconsButton> createState() => _SocialIconsButtonState();
}

class _SocialIconsButtonState extends State<SocialIconsButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    bool isLeetCode = widget.isLeetCode ?? false;
    final theme = Theme.of(context);
    final isLightMode = context.read<AppStateProvider>().isLightMode;

    final onHover = isHovering
        ? theme.colorScheme.secondary
        : isLightMode
            ? Colors.black
            : Colors.white;
    final isMobile = context.isMobile;

    final isEmail = widget.isEmail ?? false;

    return MouseRegion(
      onEnter: (event) => setState(() => isHovering = true),
      onExit: (event) => setState(() => isHovering = false),
      opaque: true,
      child: isLeetCode
          ? Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                onTap: () async => await launchUrlString(widget.text),
                child: Row(
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
                ),
              ),
            )
          : InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () async {
                if (isEmail) {
                  await Clipboard.setData(ClipboardData(text: widget.text));
                  // ignore: use_build_context_synchronously
                  context.showToast("Email copied to your clipboard.");
                } else {
                  await launchUrlString(widget.text);
                }
              },
              child: Icon(
                widget.iconData,
                size: isMobile ? 25 : 50,
                color: onHover,
              ),
            ),
    );
  }
}
