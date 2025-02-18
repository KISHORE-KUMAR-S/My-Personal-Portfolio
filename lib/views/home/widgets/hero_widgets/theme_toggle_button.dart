import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_state_provider.dart';
import '../../../../utils/config/theme_config.dart';

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({
    super.key,
    required this.color,
    required this.index,
    required this.isActive,
    required this.onTap,
  });

  final Color color;
  final int index;
  final bool isActive;
  final void Function() onTap;

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton> {
  final animationDuration = Duration(milliseconds: 500);

  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final isLightMode = context.read<AppStateProvider>().isLightMode;

    return MouseRegion(
      onEnter: (event) => setState(() => isHovering = true),
      onExit: (event) => setState(() => isHovering = false),
      child: InkWell(
        onTap: widget.onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        enableFeedback: false,
        child: _buildBorder(isLightMode: isLightMode),
      ),
    );
  }

  AnimatedContainer _buildBorder({required bool isLightMode}) {
    return AnimatedContainer(
      duration: animationDuration,
      curve: Curves.ease,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: widget.isActive
            ? Border.all(color: isLightMode ? Colors.black : Colors.white)
            : null,
      ),
      alignment: Alignment.center,
      child: _buildPaddingAroundBorder(),
    );
  }

  AnimatedPadding _buildPaddingAroundBorder() {
    return AnimatedPadding(
      padding: EdgeInsets.all(10),
      duration: animationDuration,
      curve: Curves.ease,
      child: AnimatedScale(
        scale: isHovering ? 1 : 1.2,
        duration: animationDuration,
        curve: Curves.ease,
        child: AnimatedScale(
          duration: animationDuration,
          curve: Curves.ease,
          scale: getScale(),
          child: _buildColorContainers(),
        ),
      ),
    );
  }

  Widget _buildColorContainers() {
    final provider = context.read<AppStateProvider>();
    final allThemes = ThemeConfig.allThemes(
      isLightMode: provider.isLightMode,
      themeIndex: provider.themeRepo.currentTheme,
    );

    return AnimatedContainer(
      duration: animationDuration,
      curve: Curves.ease,
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: allThemes[widget.index].colorScheme.secondary,
        shape: BoxShape.circle,
      ),
    );
  }

  double getScale() {
    if (isHovering && widget.isActive) return 3;
    if (widget.isActive) return 1.4;
    if (isHovering) return 2;

    return 1;
  }
}
