import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:periodictable/components/color_cell.dart';
import 'package:periodictable/components/selected_property_widget.dart';
import 'package:periodictable/controllers/periodictable_controller.dart';
import 'package:periodictable/controllers/temperature_controller.dart';
import 'package:periodictable/data/periodictable_data.dart';
import 'package:periodictable/pages/atom_details_page.dart';

class AtomCell extends StatelessWidget {
  AtomCell({required this.atomIndex, super.key});
  final int atomIndex;
  final PeriodicTableController periodicTableController = Get.find();
  final TemperatureController temperatureController =
      Get.put(TemperatureController());

  @override
  Widget build(BuildContext context) {
    final atom = atoms[atomIndex];
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AtomDetailsPage(atomIndex: atomIndex),
          ),
        );
      },
      child: Stack(
        children: [
          ColorCell(atomIndex: atomIndex),
          SizedBox(
            height: 80,
            width: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(atom.number.toString()),
                Text(
                  atom.symbol,
                  style: const TextStyle(
                      fontSize: 32, height: 0.95, fontWeight: FontWeight.bold),
                ),
                Text(
                  atom.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.jost(
                      height: 0.9,
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                      wordSpacing: 5),
                ),
                SelectedPropertyWidget(atomIndex: atomIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

