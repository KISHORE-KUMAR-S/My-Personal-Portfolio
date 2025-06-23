import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../utils/extensions/context_extensions.dart';
import '../../../../providers/app_state_provider.dart';

class ToggleMode extends StatefulWidget {
  const ToggleMode({
    super.key,
    required this.theme,
    required this.provider,
  });

  final ThemeData theme;
  final AppStateProvider provider;

  @override
  State<ToggleMode> createState() => _ToggleModeState();
}

class _ToggleModeState extends State<ToggleMode> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.isMobile ? 70 : 50,
      right: 20,
      child: GestureDetector(
        onTap: widget.provider.toggleIsLightMode,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.theme.colorScheme.primary.withValues(alpha: 0.8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            widget.provider.isLightMode
                ? FontAwesomeIcons.moon
                : FontAwesomeIcons.sun,
            color: widget.provider.isLightMode ? Colors.black : Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
