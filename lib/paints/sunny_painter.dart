import 'package:flutter/material.dart';

class SunnyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = 150;
    double height = 40;
    // TODO: implement paint
    Paint paint = Paint();

    paint.color = Colors.white;
    paint.strokeWidth = 0.6;

    canvas.drawLine(Offset(-10, size.height / 2), Offset(size.width + 10, size.height / 2), paint);

    Paint paint2 = Paint();
    paint2.color = const Color.fromARGB(255, 138, 159, 202);
    paint2.style = PaintingStyle.stroke;
    paint2.strokeWidth = 3;

    Paint paint3 = Paint();
    paint3.color = const Color.fromARGB(255, 13, 54, 119);
    paint3.style = PaintingStyle.stroke;
    paint3.strokeWidth = 3;

    Path path = Path();
    Path path2 = Path();
    Path path3 = Path();

    path.moveTo(-10, height);
    path.lineTo(-10 + 1, height);
    path.quadraticBezierTo(15, 35, 25, height / 2 + 6);
    path.lineTo(25, height / 2 + 5);
    canvas.drawPath(path, paint3);

    path2.moveTo(25, height / 2 + 6);
    path2.lineTo(25, height / 2 + 5);
    path2.quadraticBezierTo(width / 2 - 5, -15, width - 30, height / 2 + 6);
    path2.lineTo(width - 30, height / 2 + 6);
    canvas.drawPath(path2, paint2);

    path3.moveTo(width - 30, height / 2 + 5);
    path3.lineTo(width - 30, height / 2 + 6);
    path3.quadraticBezierTo(width - 15, 35, width + 9, height);
    path3.lineTo(width + 10, height);
    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
