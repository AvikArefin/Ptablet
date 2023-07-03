import 'package:get/get.dart';
import 'package:ptablet/controllers/list_index_func.dart';
import 'package:ptablet/controllers/temperature_controller.dart';
import 'package:ptablet/data/periodictable_data.dart';

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

  set property(Property property) => _property.value = property;

  Property get property => _property.value;

  String get propertyString => _property.value.name;

  String getSelectedProperty(int atomIndex) {
    final atom = atoms[atomIndex];
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

  ({int r, int g, int b}) getColor(int atomIndex, double currentTemperature) {
    if (atoms[atomIndex].boil == null || atoms[atomIndex].melt == null) {
      return (r: 0, g: 0, b: 0);
    } else {
      double boilingPoint = atoms[atomIndex].boil!;
      double meltingPoint = atoms[atomIndex].melt!;
      if (currentTemperature > boilingPoint) {
        return (r: 150, g: 0, b: 0);
      } else if (currentTemperature <= boilingPoint &&
          currentTemperature > meltingPoint) {
        return (r: 0, g: 150, b: 0);
      } else {
        return (r: 0, g: 0, b: 150);
      }
    }
  }
}
