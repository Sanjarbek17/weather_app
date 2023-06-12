import 'dart:math';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/paints/sunny_painter.dart';

import '../widgets/forecast_widget.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({
    super.key,
  });

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  final double width = 150;
  final double height = 40;

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      blur: 20,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(44), topRight: Radius.circular(44)),
      child: Container(
        height: 660,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Color.fromARGB(255, 255, 255, 255), blurRadius: 14, spreadRadius: -30, offset: Offset(0, 17 - 660), blurStyle: BlurStyle.outer),
            BoxShadow(color: Color.fromARGB(255, 255, 255, 255), blurRadius: 1, spreadRadius: 8, offset: Offset(0, 2), blurStyle: BlurStyle.outer),
          ],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Column(
          children: [
            const Expanded(child: ForecastWidget()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 30, 18, 67),
                      border: Border.all(color: const Color.fromARGB(255, 81, 62, 135), width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.snowing, color: Colors.grey, size: 20),
                            Text('AIR QUALITY', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey)),
                          ],
                        ),
                        const Text('3-Low Health Risk', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, height: 1.2, color: Colors.white)),
                        Stack(children: [
                          Container(
                            height: 6,
                            // width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.blue[800]!,
                                Colors.pink[400]!,
                              ]),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          Positioned(
                            // TODO: chagne this to air quality index
                            left: 320 * 0.13,
                            child: Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 1),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                )),
                          )
                        ]),
                        const Divider(color: Color.fromARGB(255, 56, 56, 58), thickness: 1),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('See more', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
                            Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customCards(
                        context,
                        title: 'UV INDEX',
                        icon: Icons.sunny,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('4', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500, height: 0.9)),
                            const Text('Moderate', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500, height: 0.01)),
                            Stack(children: [
                              Container(
                                height: 6,
                                // width: MediaQuery.of(context).size.width - 20,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.blue[800]!,
                                    Colors.pink[400]!,
                                  ]),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              Positioned(
                                // TODO: change this to uv index variebale
                                left: 141 * 0.3,
                                child: Container(height: 6, width: 6, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1), color: Colors.white, borderRadius: BorderRadius.circular(50))),
                              )
                            ]),
                          ],
                        ),
                      ),
                      customCards(
                        context,
                        title: 'SUNRISE',
                        icon: Icons.sunny_snowing,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('5:28 AM', style: TextStyle(color: Colors.white, fontSize: 24)),
                            Expanded(
                              child: CustomPaint(
                                painter: SunnyPainter(),
                                child: Stack(
                                  children: [
                                    Transform.translate(
                                      offset: Offset(width * 0.2, height * 0.3),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white, boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 7)]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Text('Sunsert: 7:25 PM', style: TextStyle(color: Colors.white, fontSize: 12)),
                            const SizedBox(height: 3),
                          ],
                        ),
                      ),
                      // const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customCards(
                        context,
                        title: 'WIND',
                        icon: Icons.air_outlined,
                        child: Center(
                            child: Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.transparent,
                                border: Border.all(color: Colors.white, width: 1),
                              ),
                            ),
                            const Positioned(
                              left: 35,
                              top: 5,
                              child: Text('N', style: TextStyle(color: Colors.white)),
                            ),
                            const Positioned(
                              top: 30,
                              left: 65,
                              child: Text('E', style: TextStyle(color: Colors.white)),
                            ),
                            const Positioned(
                              top: 30,
                              left: 5,
                              child: Text('W', style: TextStyle(color: Colors.white)),
                            ),
                            const Positioned(
                              top: 60,
                              left: 35,
                              child: Text('S', style: TextStyle(color: Colors.white)),
                            ),
                            const Positioned(
                              top: 30,
                              left: 25,
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: Text('9.7 km/h',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            Positioned(child: Transform.rotate(angle: pi - pi / 4, origin: const Offset(30, 30), child: Transform.rotate(angle: 0.8, child: const Icon(Icons.arrow_back_outlined, size: 20, color: Colors.white)))),
                          ],
                        )),
                      ),
                      // const SizedBox(width: 20),
                      customCards(
                        context,
                        title: 'RAINFALL',
                        icon: Icons.water_drop,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('1.8 mm in last hour', style: TextStyle(fontSize: 20, color: Colors.white)),
                            Text('1.2 m expected in next 24h.', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container customCards(BuildContext context, {required String title, required IconData icon, required Widget child}) {
    return Container(
      height: 130,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 9),
      width: MediaQuery.of(context).size.width / 2 - 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 36, 24, 71),
        border: Border.all(color: const Color.fromARGB(255, 81, 62, 135), width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.grey, size: 18),
              const SizedBox(width: 5),
              Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey)),
            ],
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
