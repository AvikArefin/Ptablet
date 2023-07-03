import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptablet/controllers/periodictable_controller.dart';
import 'package:ptablet/controllers/temperature_controller.dart';

class ColorCell extends StatelessWidget {
  ColorCell({
    super.key,
    required this.atomIndex,
  });

  final PeriodicTableController periodicTableController = Get.find();
  final int atomIndex;
  final TemperatureController temperatureController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        ({int r, int g, int b}) x = periodicTableController.getColor(
            atomIndex, temperatureController.currentKTemperature);
        return Container(
          color: Color.fromRGBO(x.r, x.g, x.b, 1.0),
          padding: const EdgeInsets.only(left: 2.0),
          height: 80,
          width: 80,
        );
      },
    );
  }
}