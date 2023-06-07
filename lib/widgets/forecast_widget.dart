
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../paints/curve_painter.dart';
import '../providers/forecast_provider.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 5,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.black.withAlpha((255 * 0.3).toInt())),
              )
            ],
          ),
          CustomPaint(
            painter: CurvePainter(),
            child: TabBar(
              splashBorderRadius: BorderRadius.circular(16),
              indicatorColor: Colors.white,
              tabs: const [
                Tab(text: 'Hourly Forecast'),
                Tab(text: 'Daily Forecast'),
              ],
            ),
          ),
          Expanded(
            child: Consumer<ForecastProvider>(
              builder: (context, value, child) => TabBarView(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.hourlyForecasts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: value.hourlyForecasts[index].time == 'Now' ? const Color.fromARGB(255, 72, 49, 157) : Color.fromARGB((255 * 0.3).toInt(), 72, 49, 157),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(160, 0, 0, 0),
                              blurRadius: 10,
                              // spreadRadius: 4,
                              // offset: Offset(5, 4),
                              blurStyle: BlurStyle.outer,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(value.hourlyForecasts[index].time, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
                            Image.asset(value.hourlyForecasts[index].icon),
                            Text('${value.hourlyForecasts[index].temp}°', style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: Colors.white)),
                          ],
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.hourlyForecasts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: value.hourlyForecasts[index].time == 'Now' ? const Color.fromARGB(255, 72, 49, 157) : Color.fromARGB((255 * 0.3).toInt(), 72, 49, 157),
                          boxShadow: const [BoxShadow(color: Color.fromARGB(160, 0, 0, 0), blurRadius: 10, blurStyle: BlurStyle.outer)],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(value.hourlyForecasts[index].time, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
                            Image.asset(value.hourlyForecasts[index].icon),
                            Text('${value.hourlyForecasts[index].temp}°', style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: Colors.white)),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}