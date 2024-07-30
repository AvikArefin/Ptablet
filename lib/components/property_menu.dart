import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/enum_text_func.dart';
import '../controllers/periodictable_controller.dart';

class PropertyMenu extends StatelessWidget {
  PropertyMenu({super.key});
  final PeriodicTableController periodicTableController =
      Get.put(PeriodicTableController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Currently Shown Property: '),
        const Spacer(),
        PopupMenuButton(
          child: Container(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Obx(
                  () => Text(
                    capitalizeAndAddSpaces(periodicTableController.property.name),
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          onSelected: (selectedProperty) =>
              periodicTableController.property = selectedProperty,
          itemBuilder: (context) => [
            for (final property in Property.values)
              PopupMenuItem(
                value: property,
                child: Text(capitalizeAndAddSpaces(property.name)),
              ),
          ],
        ),
      ],
    );
  }
}
