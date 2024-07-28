import 'package:flutter/material.dart';

import '../components/atom_group_menu.dart';
import '../components/black_box.dart';
import '../components/periodictable_drop_down.dart';
import '../components/temperature_widget.dart';
import 'sort_page.dart';

class PeriodicTablePage extends StatelessWidget {
  const PeriodicTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PTablet'),
        actions: [
          TemperatureWidget(),
          PropertyDropDown(),
          AtomGroupMenu(),
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
      body: InteractiveViewer(
        constrained: false,
        minScale: 0.8,
        maxScale: 3,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              top: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColoredBox(
                      color: Color.fromRGBO(150, 0, 0, 1),
                      child: SizedBox(width: 20, height: 20)),
                  Text('  Gas  '),
                  ColoredBox(
                      color: Color.fromRGBO(0, 150, 0, 1),
                      child: SizedBox(width: 20, height: 20)),
                  Text('  Liquid  '),
                  ColoredBox(
                      color: Color.fromRGBO(0, 0, 150, 1),
                      child: SizedBox(width: 20, height: 20)),
                  Text('  Solid  '),
                ],
              ),
            ),
            Column(
              children: List.generate(
                12,
                (rowNo) => Row(
                  children: List.generate(
                    19,
                    (columnNo) => BlackBox(rowNo: rowNo, columnNo: columnNo),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
