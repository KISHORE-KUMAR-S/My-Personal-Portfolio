import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:iconsax/iconsax.dart' show Iconsax;
import 'package:provider/provider.dart';
import '../../../providers/app_state_provider.dart';
import '../../../utils/extensions/context_extensions.dart';

class FooterView extends StatelessWidget {
  const FooterView({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  Widget _buildDevelopedBy(BuildContext context, {bool isColumn = false}) {
    final textStyle = Theme.of(context)
        .textTheme
        .bodyLarge
        ?.copyWith(fontWeight: FontWeight.w500);
    final circle = CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      radius: 3,
    );
    if (isColumn) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("DEVELOPED BY", style: textStyle),
          const SizedBox(height: 10),
          circle,
          const SizedBox(height: 10),
          Text("KISHORE KUMAR S",
              style: textStyle, textAlign: TextAlign.center,),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("DEVELOPED BY   ", style: textStyle),
        circle,
        Text("   KISHORE KUMAR S", style: textStyle),
      ],
    );
  }

  Widget _buildMadeIn(BuildContext context) {
    final textStyle = Theme.of(context)
        .textTheme
        .bodyLarge
        ?.copyWith(fontWeight: FontWeight.w500);
    final color = Theme.of(context).colorScheme.secondary;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("MADE IN ", style: textStyle),
        Icon(Iconsax.lovely, color: color),
        Text(" WITH ", style: textStyle),
        Icon(FontAwesomeIcons.flutter, color: color),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLightMode = context.read<AppStateProvider>().isLightMode;
    final isMobile = context.isMobile;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -1900,
          right: -1900,
          bottom: -1900,
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  theme.colorScheme.secondary,
                  theme.scaffoldBackgroundColor,
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: isMobile ? 20 : 30,
            right: isMobile ? 20 : 30,
            bottom: 150,
          ),
          clipBehavior: Clip.none,
          child: Column(
            children: [
              const SizedBox(height: 200),
              Divider(
                color: isLightMode ? Colors.black : Colors.white,
                height: 2,
              ),
              const SizedBox(height: 30),
              if (isMobile)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    width < 500
                        ? _buildDevelopedBy(context, isColumn: true)
                        : _buildDevelopedBy(context),
                    const SizedBox(height: 20),
                    _buildMadeIn(context),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildDevelopedBy(context),
                    const Spacer(),
                    const SizedBox(width: 10),
                    _buildMadeIn(context),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
