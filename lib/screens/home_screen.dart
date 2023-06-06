import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

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
                fit: BoxFit.fitWidth,
              ),
            ),
            child: SafeArea(
              child: Column(children: [
                const SizedBox(height: 64),
                const Text('Uzbekistan', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white, height: 0.1)),
                const Text('19°', style: TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.w200, height: 1.1)),
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
                        left: MediaQuery.of(context).size.width * 0.13,
                        child: Image.asset(
                          'assets/images/House.png',
                          scale: 2.6,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: BlurryContainer(
                          blur: 30,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44),
                          ),
                          child: Container(
                            height: 330,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  blurRadius: 14,
                                  spreadRadius: -30,
                                  offset: Offset(0, -313),
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
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.black.withAlpha((255 * 0.3).toInt()),
                                      ),
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
                                      Tab(text: 'Weekly Forecast'),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      SizedBox.fromSize(
                                        size: const Size(100, 100),
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 24,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              width: 60,
                                              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30),
                                                color: Colors.white.withAlpha((255 * 0.3).toInt()),
                                              ),
                                              child: const Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('12 PM', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                                                  Icon(Icons.cloud, color: Colors.white, size: 30),
                                                  Text(
                                                    '19°',
                                                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox.fromSize(
                                        size: const Size(100, 100),
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 7,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              child: Text('second'),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 90,
                                )
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
