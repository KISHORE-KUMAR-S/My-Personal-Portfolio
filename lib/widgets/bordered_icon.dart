import 'package:flutter/material.dart';

class BorderedIcon extends StatelessWidget {
  const BorderedIcon({
    super.key,
    required this.colorScheme,
    this.icon,
    this.image,
  }) : assert(icon != null || image != null,
            'Either icon or image must be provided');

  final ColorScheme colorScheme;
  final IconData? icon;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(10),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: colorScheme.secondary,
        child: icon != null
            ? Icon(
                icon,
                color: Colors.white,
                size: 15,
              )
            : Image(
                image: image!,
                color: Colors.white,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
