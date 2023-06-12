import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/weather_screen.dart';

import '../paints/navigation_painter.dart';
import '../providers/toggle_provider.dart';
import '../screens/forecast_screen.dart';

class CustomBottomNavigation extends StatelessWidget {
  final double height = 370;
  const CustomBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ToggleProvider toggle = context.read<ToggleProvider>();
    return CustomPaint(
      painter: NavigationPainter(),
      child: SizedBox(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherPage()));
                  },
                  icon: SvgPicture.asset('assets/svgs/Symbol.svg', width: 44, height: 44)),
              InkWell(
                onTap: () async {},
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black.withAlpha((255 * 0.4).toInt()), blurRadius: 10, spreadRadius: 5, blurStyle: BlurStyle.outer)],
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  // child: const Icon(Icons.add, size: 58, color: Color.fromARGB(255, 154, 42, 42)),
                  child: SvgPicture.asset('assets/svgs/add.svg', width: 30, height: 30),
                ),
              ),
              IconButton(
                  onPressed: () async {
                    toggle.toggle();
                    var s = showBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return const ForecastPage();
                      },
                    );
                    await s.closed;
                    toggle.toggle();
                  },
                  icon: SvgPicture.asset('assets/svgs/Symbol (1).svg', width: 44, height: 44)),
            ],
          ),
        ),
      ),
    );
  }
}
