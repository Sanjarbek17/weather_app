import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/forecast_provider.dart';

import '../paints/curve_painter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          // appBar: AppBar(bo),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mountain.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Column(children: [
                const SizedBox(height: 64),
                const Text('Uzbekistan', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white, height: 0.3)),
                const Text('19°', style: TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.w200, height: 1.3)),
                const Text('Mostly clear', style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 197, 197, 197), fontWeight: FontWeight.w600, height: 1.1)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'H: 24',
                      style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'L: 18',
                      style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        top: 0,
                        left: MediaQuery.of(context).size.width * 0.1,
                        child: Image.asset(
                          'assets/images/House.png',
                          scale: 2.2,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: BlurryContainer(
                          blur: 20,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44),
                          ),
                          child: Container(
                            height: 370,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  blurRadius: 14,
                                  spreadRadius: -30,
                                  offset: Offset(0, -353),
                                  blurStyle: BlurStyle.outer,
                                ),
                                BoxShadow(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  blurRadius: 1,
                                  spreadRadius: 8,
                                  offset: Offset(0, 2),
                                  blurStyle: BlurStyle.outer,
                                ),
                              ],
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                            ),
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
                                      ],
                                    ),
                                  ),
                                ),
                                CustomPaint(
                                  painter: NavigationPainter(),
                                  child: SizedBox(
                                    height: 130,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/svgs/Symbol.svg', width: 44, height: 44)),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withAlpha((255 * 0.4).toInt()),
                                                    blurRadius: 10,
                                                    spreadRadius: 5,
                                                    // offset: Offset(5, 4),
                                                    blurStyle: BlurStyle.outer,
                                                  )
                                                ],
                                                borderRadius: BorderRadius.circular(50),
                                                color: Colors.white,
                                              ),
                                              // child: const Icon(Icons.add, size: 58, color: Color.fromARGB(255, 154, 42, 42)),
                                              child: SvgPicture.asset('assets/svgs/add.svg', width: 30, height: 30),
                                            ),
                                          ),
                                          IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/svgs/Symbol (1).svg', width: 44, height: 44)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
