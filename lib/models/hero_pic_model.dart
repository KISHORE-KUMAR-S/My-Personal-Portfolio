import 'package:flutter/material.dart';

import '../providers/indie_model_provider.dart';
import 'hero_pic_widget_model.dart';

class HeroPicModel extends StatelessWidget {
  final Indie3dModelController controller;
  final int pageIndex;

  const HeroPicModel({super.key, required this.controller, this.pageIndex = 0});

  @override
  Widget build(context) {
    return Stack(
      fit: StackFit.expand,
      children: controller.meshInstances != null
          ? <int>[0, 1, 2, 3, 4, 5].map((int index) {
              return CustomPaint(
                painter: MeshCustomPainter(
                    controller.meshInstances[pageIndex * 6 + index]),
              );
            }).toList()
          : [],
    );
  }
}
