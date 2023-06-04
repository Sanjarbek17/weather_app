import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mountain.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: SafeArea(
            child: Column(children: [
              const SizedBox(height: 54),
              const Text('Bengaluru', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w400, color: Colors.white)),
              const Text('19°', style: TextStyle(fontSize: 96, color: Colors.white, fontWeight: FontWeight.w200)),
              const Text('Mostly clear', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 197, 197, 197), fontWeight: FontWeight.w600)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'H: 24',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'L: 18',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/House.png',
                            scale: 1.9,
                          ),
                        ],
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
                          height: 290,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                blurRadius: 14,
                                spreadRadius: -30,
                                offset: Offset(0, -273),
                                blurStyle: BlurStyle.outer,
                              ),
                            ],
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                icon: const Icon(Icons.home),
                                color: Colors.black,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/weather');
                                },
                                icon: const Icon(Icons.wb_sunny),
                                color: Colors.black,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/forecast');
                                },
                                icon: const Icon(Icons.wb_cloudy),
                                color: Colors.black,
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
    );
  }
}