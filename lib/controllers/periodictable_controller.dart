import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/periodictable_data.dart';
import '../models/atom_model.dart';
import 'list_index_func.dart';
import 'temperature_controller.dart';

enum Property {
  atomicMass,
  boil,
  density,
  melt,
  electronConfig,
  electronAffinity,
  electronegativityPauling,
  ionizationEnergies
}

class PeriodicTableController extends GetxController {
  final temperatureController = Get.put(TemperatureController());
  // With the power of records introduced in dart 3.0 we don't need to create
  // Seperate classes just to pass complex-data.
  // Which also means we don't need to create boilerplate code to override
  // == operator for that class or use the equatable package.
  // :) Now that's dandy. - Avik Arefin
  final Map<({int column, int row}), int> atomPositionMap =
      <({int column, int row}), int>{};
  static const _numberOfElements = 119;

  final _atomCategory = AtomCategory.values.first.obs;
  final _property = Property.atomicMass.obs;

  @override
  void onInit() {
    super.onInit();
    int rowNo = 0, columnNo = 0;
    for (int i = 0; i < _numberOfElements; i++) {
      columnNo = atoms[i].xpos;
      rowNo = atoms[i].ypos;
      atomPositionMap[(column: columnNo, row: rowNo)] = i;
    }
  }

  set atomCategory(AtomCategory atomCategory) =>
      _atomCategory.value = atomCategory;

  set property(Property property) => _property.value = property;

  AtomCategory get atomCategory => _atomCategory.value;

  Property get property => _property.value;

  String get propertyString => _property.value.name;

  String getSelectedProperty(Atom atom) {
    switch (_property.value) {
      case Property.atomicMass:
        return atom.atomicMass == null
            ? ''
            : atom.atomicMass!.toStringAsFixed(2);
      case Property.boil:
        return atom.boil == null ? '' : atom.boil!.toStringAsFixed(2);
      case Property.density:
        return atom.density == null ? '' : atom.density!.toStringAsFixed(2);
      case Property.melt:
        return atom.melt == null ? '' : atom.melt!.toStringAsFixed(2);
      case Property.electronConfig:
        return atom.electronConfigurationSemantic;
      case Property.electronAffinity:
        return atom.electronAffinity == null
            ? ''
            : atom.electronAffinity!.toStringAsFixed(2);
      case Property.electronegativityPauling:
        return atom.electronegativityPauling == null
            ? ''
            : atom.electronegativityPauling!.toStringAsFixed(2);
      case Property.ionizationEnergies:
        return safeValueFromListAsString(atom.ionizationEnergies, 0);
    }
  }

  Color getColor(Atom atom, double currentTemperature) {
    if (_atomCategory.value != AtomCategory.all) {
      if (atom.category != _atomCategory.value) {
        return Colors.transparent;
      }
    }
    if (atom.boil == null || atom.melt == null) {
      return const Color.fromRGBO(50, 50, 50, 1.0);
    } else {
      double boilingPoint = atom.boil!;
      double meltingPoint = atom.melt!;
      if (currentTemperature > boilingPoint) {
        return const Color.fromRGBO(150, 0, 0, 1.0);
      } else if (currentTemperature <= boilingPoint &&
          currentTemperature > meltingPoint) {
        return const Color.fromRGBO(0, 150, 0, 1.0);
      } else {
        return const Color.fromRGBO(0, 0, 150, 1.0);
      }
    }
  }
}
