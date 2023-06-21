import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ListTilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.shader = ui.Gradient.linear(
      const Offset(0, 0),
      Offset(size.width, size.height),
      [
        const Color(0xFF362A84),
        const Color(0xFF5936B4),
      ],
    );
    paint.strokeWidth = 4;
    paint.style = PaintingStyle.fill;

    Path path = Path();
    // bottom right
    path.moveTo(size.width - 30, size.height);
    // bottom left
    path.lineTo(30, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 30);
    // top left
    path.lineTo(0, 40);
    path.quadraticBezierTo(5, -10, 60, 5);
    // top right
    path.lineTo(size.width - 30, size.height / 2 - 10);
    path.quadraticBezierTo(size.width, size.height / 2, size.width, size.height / 2 + 30);
    // bottom right
    path.lineTo(size.width, size.height - 30);
    path.quadraticBezierTo(size.width, size.height, size.width - 30, size.height);
    // path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
