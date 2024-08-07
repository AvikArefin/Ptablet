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
    return Row(
      children: [
        const Text('Currently Shown Groups: '),
        const Spacer(),
        PopupMenuButton(
          child: Container(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Obx(
                  () => Text(
                    capitalizeAndAddSpaces(periodicTableController.atomCategory.name),
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
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
      ],
    );
  }
}
