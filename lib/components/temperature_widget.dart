import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptablet/controllers/temperature_controller.dart';

class TemperatureWidget extends StatelessWidget {
  TemperatureWidget({super.key});
  final controller = Get.put(TemperatureController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                contentPadding: const EdgeInsets.only(top: 10.0),
                title: const Text(
                  "Select Current Temperature",
                  style: TextStyle(fontSize: 24.0),
                ),
                content: Wrap(
                  children: [
                    Obx(() => Slider(
                          value: controller.currentKTemperature,
                          min: 0.0,
                          max: 5000.0,
                          divisions: 100,
                          label:
                              controller.currentKTemperature.round().toString(),
                          onChanged: (double value) {
                            controller.currentKTemperature =
                                value.roundToDouble();
                          },
                        )),
                  ],
                ),
              );
            },
          );
        },
        child: Obx(() => Text(controller.currentKTemperature.toString())),
      ),
    );
  }
}
