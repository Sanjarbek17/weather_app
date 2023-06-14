import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/forecast_provider.dart';
import 'package:weather_app/providers/toggle_provider.dart';

import '../widgets/custom_navigation_widget.dart';
import '../widgets/forecast_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 370;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ForecastProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    bool isExpanded = context.watch<ToggleProvider>().isExpanded;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Container(
            decoration: isExpanded
                ? const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/mountain.png'), fit: BoxFit.cover),
                  )
                : const BoxDecoration(
                    gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 46, 51, 88),
                      Color.fromARGB(255, 28, 27, 51),
                    ],
                  )),
            child: SafeArea(
              child: Column(children: [
                const SizedBox(height: 64),
                const Text('Uzbekistan', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white, height: 0.3)),
                isExpanded ? const Text('19°', style: TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.w200, height: 1.3)) : const Text('19° | Mostly clear', style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 197, 197, 197), fontWeight: FontWeight.w600, height: 1.5)),
                isExpanded ? const Text('Mostly clear', style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 197, 197, 197), fontWeight: FontWeight.w600, height: 1.1)) : const SizedBox(),
                isExpanded
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('H: 24', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600)), SizedBox(width: 10), Text('L: 18', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600))],
                      )
                    : const SizedBox(),
                const SizedBox(height: 20),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      isExpanded
                          ? Positioned(
                              top: 0,
                              left: MediaQuery.of(context).size.width * 0.1,
                              child: Image.asset('assets/images/House.png', scale: 2.2),
                            )
                          : const SizedBox(),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: BlurryContainer(
                              blur: 20,
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(44), topRight: Radius.circular(44)),
                              child: Container(
                                height: 370,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(color: const Color.fromARGB(255, 255, 255, 255), blurRadius: 14, spreadRadius: -30, offset: Offset(0, 17 - height), blurStyle: BlurStyle.outer),
                                    const BoxShadow(color: Color.fromARGB(255, 255, 255, 255), blurRadius: 1, spreadRadius: 8, offset: Offset(0, 2), blurStyle: BlurStyle.outer),
                                  ],
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                                ),
                                child: const Column(
                                  children: [
                                    Expanded(child: ForecastWidget()),
                                    CustomBottomNavigation(),
                                  ],
                                ),
                              )))
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
