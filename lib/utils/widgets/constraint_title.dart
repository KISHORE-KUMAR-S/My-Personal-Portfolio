import 'package:flutter/material.dart';
import 'package:personal_portfolio/providers/app_state_provider.dart';
import 'package:provider/provider.dart';

import '../extensions/context_extensions.dart';

class ConstraintTitle extends StatelessWidget {
  const ConstraintTitle({
    super.key,
    required this.isVisible,
    required this.title,
  });

  final bool isVisible;
  final String title;

  @override
  Widget build(BuildContext context) {
    bool isLightMode = context.read<AppStateProvider>().isLightMode;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: context.isMobile ? 300 : 400,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 50),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                height: 1,
                color: isLightMode ? Colors.black : Colors.white,
                curve: Curves.easeOutCirc,
                width: isVisible ? 400 : 0,
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: isVisible ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: AnimatedSlide(
              offset: isVisible ? Offset(0, 0) : Offset(2, 0),
              duration: Duration(milliseconds: 500),
              child: Text(title),
            ),
          )
        ],
      ),
    );
  }
}
