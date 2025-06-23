import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class AnimatedBubbleButton extends StatefulWidget {
  AnimatedBubbleButton({
    super.key,
    this.title = "",
    this.titleStyle,
    this.height = 50,
    this.startWidth = 50,
    this.targetWidth = 150,
    this.color = Colors.black87,
    this.imageColor = Colors.white,
    this.curve = Curves.easeIn,
    this.duration = const Duration(milliseconds: 300),
    this.child,
    this.startBorderRadius = const BorderRadius.all(Radius.circular(80)),
    this.offsetAnimation,
    this.startOffset = const Offset(0, 0),
    this.targetOffset = const Offset(0.1, 0),
    this.onTap,
    this.endBorderRadius,
    this.controller,
    this.controlsOwnAnimation = true,
    this.hovering,
  });

  final String title;
  final TextStyle? titleStyle;
  final double height;
  final double startWidth;
  final double targetWidth;
  final Color color;
  final Color imageColor;
  final Curve curve;
  final Duration duration;
  final Widget? child;
  final BorderRadiusGeometry startBorderRadius;
  final Animation<Offset>? offsetAnimation;
  final Offset startOffset;
  final Offset targetOffset;
  final GestureTapCallback? onTap;
  final BorderRadiusGeometry? endBorderRadius;
  final AnimationController? controller;
  bool? hovering;
  bool controlsOwnAnimation;

  @override
  State<AnimatedBubbleButton> createState() => _AnimatedBubbleButtonState();
}

class _AnimatedBubbleButtonState extends State<AnimatedBubbleButton>
    with SingleTickerProviderStateMixin {
  bool isHovering = false;
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();

    controller = widget.controller ??
        AnimationController(vsync: this, duration: widget.duration);

    offsetAnimation = widget.offsetAnimation ??
        Tween<Offset>(begin: widget.startOffset, end: widget.targetOffset)
            .animate(CurvedAnimation(parent: controller, curve: widget.curve))
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    TextStyle? buttonStyle = textTheme.bodyLarge?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );

    void mouseEnter(bool hovering) {
      if (hovering) {
        setState(() {
          isHovering = hovering;
          controller.forward();
        });
      } else {
        setState(() {
          isHovering = hovering;
          controller.reverse();
        });
      }
    }

    return MouseRegion(
      onEnter: widget.controlsOwnAnimation ? (event) => mouseEnter(true) : null,
      onExit: widget.controlsOwnAnimation ? (event) => mouseEnter(false) : null,
      child: SlideTransition(
        position: offsetAnimation,
        child: InkWell(
          hoverColor: Colors.transparent,
          onTap: widget.onTap,
          child: SizedBox(
            width: widget.targetWidth,
            height: widget.height,
            child: Stack(
              children: [
                Positioned(
                  child: AnimatedContainer(
                    duration: widget.duration,
                    width: (widget.hovering ?? isHovering)
                        ? widget.targetWidth
                        : widget.startWidth,
                    alignment: Alignment.centerLeft,
                    height: widget.height,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: (widget.hovering ?? isHovering)
                          ? (widget.endBorderRadius ?? widget.startBorderRadius)
                          : widget.startBorderRadius,
                    ),
                  ),
                ),
                Center(
                  child: widget.child ??
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            widget.title,
                            textAlign: TextAlign.center,
                            style: widget.titleStyle ?? buttonStyle,
                          ),
                          FaIcon(
                            FontAwesomeIcons.arrowRight,
                            size: 20,
                          )
                        ],
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
