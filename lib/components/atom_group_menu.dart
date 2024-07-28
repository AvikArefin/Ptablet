import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptablet/controllers/enum_text_func.dart';
import 'package:ptablet/models/atom_model.dart';

import '../controllers/periodictable_controller.dart';

class AtomGroupMenu extends StatelessWidget {
  AtomGroupMenu({super.key});

  final PeriodicTableController periodicTableController =
      Get.put(PeriodicTableController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: PopupMenuButton(
        onSelected: (selectedCategory) =>
            periodicTableController.atomCategory = selectedCategory,
        itemBuilder: (context) => [
          for (final category in AtomCategory.values)
            PopupMenuItem(
              value: category,
              child: Text(capitalizeAndAddSpaces(category.name)),
            ),
        ],
      ),
    );
  }
}
