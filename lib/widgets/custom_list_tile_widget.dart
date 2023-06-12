import 'package:flutter/material.dart';
import 'package:weather_app/paints/list_tile_painter.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: CustomPaint(
        painter: ListTilePainter(),
        child: Container(
          padding: const EdgeInsets.only(left: 25, bottom: 25, right: 25),
          decoration: const BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   stops: [0.0039, 0.9939],
              //   colors: [
              //     Color(0xFF362A84),
              //     Color(0xFF5936B4),
              //   ],
              //   transform: GradientRotation(270.6 * 3.14159 / 180),
              // ),
              ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '19°',
                        style: TextStyle(fontSize: 64, fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 150),
                  Positioned(
                    top: -40,
                    right: 0,
                    child: Image.asset('assets/icons/Moon cloud mid rain.png', scale: 3.8),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'H:24°   L:18°',
                        style: TextStyle(fontSize: 17, color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Samarkand, Uzbekistan',
                        style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Text('Mid Rain', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
