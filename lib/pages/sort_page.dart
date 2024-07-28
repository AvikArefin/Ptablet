import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/enum_text_func.dart';
import '../controllers/sort_controller.dart';

class SortPage extends StatelessWidget {
  SortPage({super.key});
  final SortController sortController = Get.find();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 16;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.close)),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Obx(
                () {
                  final totalItemNo = sortController.sortedList.length;
                  double maxValue = 1.0;
                  if (totalItemNo != 0) {
                    maxValue =
                        sortController.sortedList[totalItemNo - 1].atomProperty!;
                  }
                  return ListView.builder(
                    itemCount: totalItemNo,
                    itemBuilder: (context, i) {
                      final item = sortController.sortedList[i];
                      return Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            // padding: EdgeInsets.all(8.0),
                            width: width * ((item.atomProperty!).abs() / maxValue),
                            height: 34,
                            color: Theme.of(context).focusColor,
                          ),
                          Column(
                            children: [
                              Text(item.symbol),
                              Text(item.atomProperty!.toString()),
                            ],
                          ),
                        ],
                      );
                    },
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
