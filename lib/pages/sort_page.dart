import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptablet/controllers/enum_text_func.dart';
import 'package:ptablet/controllers/sort_controller.dart';

class SortPage extends StatelessWidget {
  SortPage({super.key});
  final SortController sortController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.close)),
        body: Stack(
          children: [
            Obx(
              () => ListView.builder(
                itemCount: sortController.sortedList.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(sortController.sortedList[i].symbol),
                    subtitle: Text(
                      sortController.sortedList[i].atomProperty!.toString(),
                    ),
                  );
                },
              ),
            ),
            Positioned(
                top: 10,
                right: 10,
                child: SafeArea(
                  child: Row(
                    children: [
                      Obx(() => Text(
                          sortController.selectedSortPropertyString.value)),
                      PopupMenuButton(
                        onSelected: (selectedProperty) {
                          sortController.selectedSortProperty.value =
                              selectedProperty;
                          sortController.propertySorter();
                        },
                        itemBuilder: (context) => [
                          for (final property in SortProperty.values)
                            PopupMenuItem(
                              value: property,
                              child:
                                  Text(capitalizeAndAddSpaces(property.name)),
                            ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
