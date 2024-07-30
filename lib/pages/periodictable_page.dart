import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ptablet/controllers/temperature_controller.dart';

import '../components/black_box.dart';
import '../components/options_sheet.dart';
import '../components/temperature_widget.dart';
import 'about_page.dart';
import 'sort_page.dart';

class PeriodicTablePage extends StatelessWidget {
  const PeriodicTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
            child: const Text('PTablet')),
        actions: [
          GetX<TemperatureController>(
            builder: (controller) {
              return Text(
                'T = ${controller.currentKTemperature.toStringAsFixed(1)}K',
              );
            },
          ),
          Tooltip(
            message: "Options",
            child: IconButton(
                onPressed: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) => const OptionsSheet()),
                constraints: const BoxConstraints(minWidth: 26, minHeight: 26),
                icon: const Icon(Icons.menu)),
          )
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
                  ColoredBox(
                      color: Color.fromRGBO(50, 50, 50, 1.0),
                      child: SizedBox(width: 20, height: 20)),
                  Text('  Unknown  '),
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
