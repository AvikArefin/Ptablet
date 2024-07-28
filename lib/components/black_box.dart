import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/periodictable_controller.dart';
import '../controllers/sort_controller.dart';
import '../data/periodictable_data.dart';
import 'atom_cell.dart';
import 'number_cell.dart';

class BlackBox extends StatelessWidget {
  BlackBox({super.key, required this.rowNo, required this.columnNo});
    final PeriodicTableController periodicTableController =
      Get.put(PeriodicTableController());
  final SortController sortController = Get.put(SortController());
  final int rowNo;
  final int columnNo;

  @override
  Widget build(BuildContext context) {
    if (rowNo == 0 && columnNo == 0) {
      return const SizedBox(width: 20, height: 20);
    } else if (rowNo == 0) {
      return NumberCell(value: columnNo, width: 80);
    } else if (columnNo == 0) {
      return NumberCell(value: rowNo, height: 80);
    } else {
      final atomIndex = periodicTableController
          .atomPositionMap[(column: columnNo, row: rowNo)];
      return atomIndex == null
          ? const SizedBox(width: 80, height: 80)
          : AtomCell(atom: atoms[atomIndex]);
    }
  }
}
