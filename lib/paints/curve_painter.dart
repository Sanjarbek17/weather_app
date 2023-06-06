import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final paint = Paint();
    // paint.color = Colors.white.withOpacity(0.2);
    // paint.style = PaintingStyle.stroke;
    // paint.strokeWidth = 3;

    canvas.drawLine(
        Offset(-10, size.height),
        Offset(size.width + 10, size.height),
        Paint()
          ..color = Colors.white.withOpacity(0.2)
          ..strokeWidth = 1);

    // final path = Path();
    // path.moveTo(-10, size.height);
    // path.quadraticBezierTo(-5, -2, 25, -3);
    // path.addArc(Rect., startAngle, sweepAngle)
    // path.lineTo(size.width, size.height);
    // // path.quadraticBezierTo(size.width * 0.75, size.height * 0.3, size.width, size.height * 0.2);
    // path.lineTo(0, size.height);
    // path.close();

    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
