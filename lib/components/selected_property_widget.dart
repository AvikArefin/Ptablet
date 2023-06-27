import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:periodictable/controllers/periodictable_controller.dart';

class SelectedPropertyWidget extends StatelessWidget {
  SelectedPropertyWidget({super.key, required this.atomIndex});
  final int atomIndex;
  final PeriodicTableController periodicTableController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        periodicTableController.getSelectedProperty(atomIndex),
        style: const TextStyle(height: 0.9, fontSize: 10),
      ),
    );
  }
}
