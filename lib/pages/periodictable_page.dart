import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptablet/components/atom_cell.dart';
import 'package:ptablet/components/number_cell.dart';
import 'package:ptablet/components/periodictable_drop_down_widget.dart';
import 'package:ptablet/components/temperature_widget.dart';
import 'package:ptablet/controllers/periodictable_controller.dart';
import 'package:ptablet/controllers/sort_controller.dart';
import 'package:ptablet/pages/sort_page.dart';

class PeriodicTablePage extends StatelessWidget {
  PeriodicTablePage({Key? key}) : super(key: key);
  final PeriodicTableController periodicTableController =
      Get.put(PeriodicTableController());
  final SortController sortController = Get.put(SortController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PTablet'),
        actions: [
          TemperatureWidget(),
          PeriodicTableDropDownWidget(
              periodicTableController: periodicTableController),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SortPage(),
            ),
          );
        },
        child: const Icon(Icons.sort),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InteractiveViewer(
          constrained: false,
          minScale: 0.1,
          maxScale: 2,
          child: Column(
            children: List.generate(
              12,
              (rowNo) => Row(
                children: List.generate(
                  19,
                  (columnNo) {
                    if (rowNo == 0 && columnNo == 0) {
                      return const SizedBox(width: 20, height: 20);
                    } else if (rowNo == 0) {
                      return NumberCell(value: columnNo, width: 80);
                    } else if (columnNo == 0) {
                      return NumberCell(value: rowNo, height: 80);
                    } else {
                      var atomIndex = periodicTableController
                          .atomPositionMap[(column: columnNo, row: rowNo)];
                      return atomIndex == null
                          ? const SizedBox(width: 80, height: 80)
                          : AtomCell(atomIndex: atomIndex);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
