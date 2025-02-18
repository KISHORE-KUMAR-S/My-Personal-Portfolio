import 'package:flutter/material.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      right: 20,
      child: Switch(
        activeTrackColor: Colors.transparent,
        activeColor: widget.theme.colorScheme.secondary,
        inactiveThumbColor: Colors.white,
        value: widget.provider.isLightMode,
        onChanged: (value) => widget.provider.toggleIsLightMode(),
      ),
    );
  }
}
