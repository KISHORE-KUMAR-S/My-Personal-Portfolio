import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_state_provider.dart';
import '../../utils/animations/circular_reveal.dart';
import '../../utils/extensions/context_extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _gradientAnimationController,
      _textAnimationController;

  late Animation<double> _gradientAnimation, _textAnimation;

  @override
  void initState() {
    super.initState();

    double lowerBound = 0, upperBound = 1;
    Cubic easeOutBack = Cubic(0.175, 0.9, 0.48, 1.375);

    _gradientAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      lowerBound: lowerBound,
      upperBound: upperBound,
    );

    _textAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
      lowerBound: lowerBound,
      upperBound: upperBound,
    );

    _gradientAnimation = Tween<double>(
      begin: lowerBound,
      end: upperBound,
    ).animate(
      CurvedAnimation(
        parent: _gradientAnimationController,
        curve: Cubic(0.14, 0.59, 0.84, -0.31),
      ),
    );

    _textAnimation = Tween<double>(
      begin: lowerBound,
      end: upperBound,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: easeOutBack,
    ));

    _textAnimationController.forward();
    _gradientAnimationController.forward();

    Future.delayed(Duration(seconds: 4), () {
      // ignore: use_build_context_synchronously
      context.read<AppStateProvider>().setNavAnimationStatus(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        color: theme.colorScheme.secondary,
        child: CircularRevealAnimation(
          animation: _gradientAnimation,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: _textAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _textAnimation.value,
                      child: Text.rich(
                        TextSpan(
                            text: "KK",
                            style: theme.textTheme.titleLarge!.copyWith(
                              fontSize: context.isMobile ? 50 : 80,
                              letterSpacing: 2,
                            ),
                            children: [
                              TextSpan(
                                text: ".",
                                style: TextStyle(
                                  color: theme.colorScheme.secondary,
                                ),
                              )
                            ]),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
