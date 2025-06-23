import 'package:flutter/material.dart';

class LocalSendLogo extends StatefulWidget {
  const LocalSendLogo({super.key});

  @override
  State<LocalSendLogo> createState() => _LocalSendLogoState();
}

class _LocalSendLogoState extends State<LocalSendLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(); // infinite rotation
  }

  @override
  void dispose() {
    _controller.dispose(); // clean up
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logo = ColorFiltered(
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.secondary,
        BlendMode.srcATop,
      ),
      child: Image.asset(
        'assets/images/localsend.png',
        width: 200,
        height: 200,
      ),
    );

    return RotationTransition(
      turns: _controller,
      child: logo,
    );
  }
}
