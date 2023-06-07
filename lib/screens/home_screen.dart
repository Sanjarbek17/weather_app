import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../paints/curve_painter.dart';
import '../widgets/forecast_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/mountain.png'), fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Column(children: [
                const SizedBox(height: 64),
                const Text('Uzbekistan', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white, height: 0.3)),
                const Text('19°', style: TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.w200, height: 1.3)),
                const Text('Mostly clear', style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 197, 197, 197), fontWeight: FontWeight.w600, height: 1.1)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('H: 24', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600)), SizedBox(width: 10), Text('L: 18', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600))],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        top: 0,
                        left: MediaQuery.of(context).size.width * 0.1,
                        child: Image.asset('assets/images/House.png', scale: 2.2),
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: BlurryContainer(
                            blur: 20,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(44), topRight: Radius.circular(44)),
                            child: isExpanded
                                ? AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    height: 370,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(color: Color.fromARGB(255, 255, 255, 255), blurRadius: 14, spreadRadius: -30, offset: Offset(0, -353), blurStyle: BlurStyle.outer),
                                        BoxShadow(color: Color.fromARGB(255, 255, 255, 255), blurRadius: 1, spreadRadius: 8, offset: Offset(0, 2), blurStyle: BlurStyle.outer),
                                      ],
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                                    ),
                                    child: Column(
                                      children: [
                                        const ForecastWidget(),
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
                                                    onTap: () {
                                                      setState(() {
                                                        isExpanded = false;
                                                      });
                                                    },
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
                                                  IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/svgs/Symbol (1).svg', width: 44, height: 44)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    height: 800,
                                    // width: ,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(color: Color.fromARGB(255, 255, 255, 255), blurRadius: 14, spreadRadius: -30, offset: Offset(0, -353), blurStyle: BlurStyle.outer),
                                        BoxShadow(color: Color.fromARGB(255, 255, 255, 255), blurRadius: 1, spreadRadius: 8, offset: Offset(0, 2), blurStyle: BlurStyle.outer),
                                      ],
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                                    ),
                                    child: Column(
                                      children: [
                                        const ForecastWidget(),
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
                                                    onTap: () {
                                                      setState(() {
                                                        isExpanded = true;
                                                      });
                                                    },
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
                                                  IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/svgs/Symbol (1).svg', width: 44, height: 44)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ))
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
