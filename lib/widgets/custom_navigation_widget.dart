import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/widgets/forecast_widget.dart';

import '../paints/navigation_painter.dart';
import '../providers/toggle_provider.dart';

class CustomBottomNavigation extends StatelessWidget {
  final double height = 370;
  const CustomBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ToggleProvider toggle = context.read<ToggleProvider>();
    return CustomPaint(
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
                onTap: () async {
                  toggle.toggle();
                  var s = customBottomSheet(context);
                  await s.closed;
                  toggle.toggle();
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
    );
  }

  PersistentBottomSheetController<dynamic> customBottomSheet(BuildContext context) {
    return showBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
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
            child: const ForecastWidget(),
          ),
        );
      },
    );
  }
}
