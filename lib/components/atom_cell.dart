import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/periodictable_controller.dart';
import '../controllers/temperature_controller.dart';
import '../models/atom_model.dart';
import '../pages/atom_details_page.dart';

class AtomCell extends StatelessWidget {
  AtomCell({required this.atom, super.key});
  final Atom atom;
  final PeriodicTableController periodicTableController = Get.find();
  final TemperatureController temperatureController =
      Get.put(TemperatureController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AtomDetailsPage(atom: atom),
          ),
        );
      },
      child: Stack(
        children: [
          Obx(
            () {
              /// This is the ColorCell
              final color = periodicTableController.getColor(
                  atom, temperatureController.currentKTemperature);
              late final Color textColor;
              if (color == Colors.transparent) {
                textColor = Colors.transparent;
              } else {
                textColor = Colors.white;
              }
              return Container(
                color: color,
                padding: const EdgeInsets.only(left: 2.0),
                height: 80,
                width: 80,
                child: Column(
                  children: [
                    /// This is the NumberCell
                    Text(atom.number.toString(),
                        style: TextStyle(color: textColor)),
                    Text(
                      atom.symbol,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 32,
                          height: 0.95,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      atom.name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.jost(
                          color: textColor,
                          height: 0.9,
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          wordSpacing: 5),
                    ),

                    /// This is the SelectedPropertyWidget
                    Text(
                      periodicTableController.getSelectedProperty(atom),
                      style: TextStyle(
                          color: textColor, height: 0.9, fontSize: 10),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
