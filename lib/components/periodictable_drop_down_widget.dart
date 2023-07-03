import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptablet/controllers/enum_text_func.dart';
import 'package:ptablet/controllers/periodictable_controller.dart';

class PeriodicTableDropDownWidget extends StatelessWidget {
  const PeriodicTableDropDownWidget({
    super.key,
    required this.periodicTableController,
  });

  final PeriodicTableController periodicTableController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Obx(() => Text(
              capitalizeAndAddSpaces(periodicTableController.propertyString))),
          PopupMenuButton(
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
      ),
    );
  }
}
