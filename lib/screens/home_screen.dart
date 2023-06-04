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
              Image.asset(
                'assets/images/House.png',
                scale: 2,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
