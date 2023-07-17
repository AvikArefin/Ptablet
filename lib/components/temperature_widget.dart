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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 16.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.12),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: Obx(() => Text(
                                '${(controller.currentKTemperature).toStringAsFixed(1)}K')),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 16.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.12),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: Obx(() => Text(
                                '${(controller.currentCTemperature).toStringAsFixed(1)}C')),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 16.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.12),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: Obx(() => Text(
                                '${(controller.currentFTemperature).toStringAsFixed(1)}F')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Obx(() =>
            Text('${controller.currentKTemperature.toStringAsFixed(1)}K')),
      ),
    );
  }
}
