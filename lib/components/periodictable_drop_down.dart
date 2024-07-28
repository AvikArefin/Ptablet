import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/enum_text_func.dart';
import '../controllers/periodictable_controller.dart';

class PropertyDropDown extends StatelessWidget {
  PropertyDropDown({super.key});
  final PeriodicTableController periodicTableController =
      Get.put(PeriodicTableController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton(
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
    );
  }
}
