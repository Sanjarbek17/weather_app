import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

import '../widgets/forecast_widget.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({
    super.key,
  });

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
        child: const Column(
          children: [
            ForecastWidget(),
            
          ],
        ),
      ),
    );
  }
}
