import 'package:flutter/material.dart';

import '../widgets/custom_list_tile_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0283, 0.9485],
        colors: [
          Color.fromARGB(255, 63, 70, 120),
          Color.fromARGB(255, 39, 38, 72),
        ],
        transform: GradientRotation(169.61 * 3.14159 / 180),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Weather', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400)),
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0162, 0.9572],
                    colors: [
                      Color.fromRGBO(13, 14, 24, 0.259),
                      Color.fromRGBO(16, 15, 29, 0.259),
                    ],
                    transform: GradientRotation(168.44 * 3.14159 / 180),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    // innter top shadow
                    BoxShadow(color: Color.fromARGB(255, 17, 18, 32), blurRadius: 50, blurStyle: BlurStyle.inner),
                    // inner bottom shadow
                  ],
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIconColor: Color.fromARGB((255 * 0.6).toInt(), 235, 235, 245),
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search for a city or airport',
                    hintStyle: TextStyle(color: Color.fromARGB((255 * 0.6).toInt(), 235, 235, 245), height: 0.9, fontSize: 17),
                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CustomListTileWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
