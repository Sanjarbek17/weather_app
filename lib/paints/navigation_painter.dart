import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class NavigationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color.fromARGB((255 * 0.5).toInt(), 117, 130, 244);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 0.5;

    final path = Path();
    path.moveTo(-10, 10);
    // path.lineTo(-10, 5);
    // path.moveTo(-10, size.height);
    path.quadraticBezierTo(size.width * 0.5, 80, size.width + 10, 10);
    // path.addArc(Rect., startAngle, sweepAngle)
    // path.lineTo(size.width, size.height);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.3, size.width, size.height * 0.2);
    // path.close();

    canvas.drawPath(path, paint);

    final paint3 = Paint();
    paint3.color = Color.fromARGB((255 * 0.5).toInt(), 117, 130, 244);
    paint3.strokeWidth = 0.5;
    paint3.style = PaintingStyle.stroke;

    final paint2 = Paint();
    paint2.color = Color.fromARGB((255 * 1).toInt(), 117, 130, 244);
    paint2.strokeWidth = 1;
    paint2.style = PaintingStyle.fill;
    paint2.shader = ui.Gradient.linear(const Offset(120, 30), const Offset(120, 150), [
      const Color.fromARGB(255, 29, 33, 60),
      const Color.fromARGB(255, 62, 63, 116),
    ]);

    final path2 = Path();
    // print('size.height: ${size.height} - size.width: ${size.width.toInt()}');

    path2.moveTo(60, size.height + 10);

    path2.quadraticBezierTo(120 - 10, 130, 133 - 10, 50);
    // path2.lineTo(143, 50);
    path2.quadraticBezierTo(140 - 10, 10, 200 - 10, 10);
    // path2.lineTo(210, 10);
    path2.quadraticBezierTo(260 + 9, 7, 265 + 9, 50);
    // path2.lineTo(275, 90);
    path2.quadraticBezierTo(280 + 9, 130, 340, size.height + 10);

    canvas.drawPath(path2, paint2);
    canvas.drawPath(path2, paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
