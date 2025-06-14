import 'dart:async' show Timer;
import 'package:animated_flip_counter/animated_flip_counter.dart'
    show AnimatedFlipCounter;
import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;
import 'package:intl/intl.dart' show DateFormat;
import '../../../../utils/config/constants.dart';
import '../../../../utils/extensions/context_extensions.dart';

class LocationAndTime extends StatefulWidget {
  const LocationAndTime({super.key});

  @override
  State<LocationAndTime> createState() => _LocationAndTimeState();
}

class _LocationAndTimeState extends State<LocationAndTime> {
  late final Timer _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => mounted ? setState(() => _now = DateTime.now()) : null,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    // Responsive font size
    final double fontSize = context.isMobile ? 12 : 16;

    return Positioned(
      bottom: context.isMobile ? 20 : 30,
      left: 0,
      right: 0,
      child: Entry.opacity(
        delay: Constants.smallDelay,
        duration: Constants.smallDelay,
        curve: Curves.ease,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            if (!context.isMobile) _buildIcon(colorScheme, Iconsax.location),
            if (!context.isMobile) Text("India", style: textTheme.bodyLarge),
            _buildAnimatedFlipCounter(
              value: DateFormat('hh').format(_now),
              fontSize: fontSize,
              textTheme: textTheme,
            ),
            _buildSeparator(textTheme, fontSize),
            _buildAnimatedFlipCounter(
              value: _now.minute.toString(),
              fontSize: fontSize,
              textTheme: textTheme,
            ),
            _buildSeparator(textTheme, fontSize),
            _buildAnimatedFlipCounter(
              value: _now.second.toString(),
              fontSize: fontSize,
              textTheme: textTheme,
              wholeDigits: 2,
            ),
            Text(DateFormat('a').format(_now), style: textTheme.bodyLarge),
            if (!context.isMobile) _buildIcon(colorScheme, Iconsax.clock),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedFlipCounter({
    required String value,
    required double fontSize,
    required TextTheme textTheme,
    int wholeDigits = 1,
  }) {
    return AnimatedFlipCounter(
      value: int.parse(value),
      textStyle: textTheme.bodyLarge!.copyWith(fontSize: fontSize),
      wholeDigits: wholeDigits,
      hideLeadingZeroes: false,
      curve: Curves.easeInOut,
    );
  }

  Widget _buildSeparator(TextTheme textTheme, double fontSize) {
    return Text(
      ":",
      style: textTheme.bodyLarge!.copyWith(fontSize: fontSize),
    );
  }

  Widget _buildIcon(ColorScheme colorScheme, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(10),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: colorScheme.secondary,
        child: Icon(
          icon,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
