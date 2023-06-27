import 'package:get/get.dart';
import 'package:periodictable/controllers/enum_text_func.dart';
import 'package:periodictable/controllers/list_index_func.dart';
import 'package:periodictable/data/periodictable_data.dart';

enum SortProperty {
  atomicMass,
  boil,
  density,
  melt,
  electronAffinity,
  electronegativityPauling,
  firstIonizationEnergy,
  secondIonizationEnergy,
}

class SortController extends GetxController {
  List<({String symbol, double? atomProperty})> sortedList =
      <({String symbol, double? atomProperty})>[].obs;

  var selectedSortProperty = SortProperty.atomicMass.obs;
  var selectedSortPropertyString = 'SELECT SORT PROPERTY'.obs;

  double? getProperty(int atomIndex) {
    switch (selectedSortProperty.value) {
      case SortProperty.atomicMass:
        return atoms[atomIndex].atomicMass;
      case SortProperty.boil:
        return atoms[atomIndex].boil;
      case SortProperty.density:
        return atoms[atomIndex].density;
      case SortProperty.melt:
        return atoms[atomIndex].melt;
      case SortProperty.electronAffinity:
        return atoms[atomIndex].electronAffinity;
      case SortProperty.electronegativityPauling:
        return atoms[atomIndex].electronegativityPauling;
      case SortProperty.firstIonizationEnergy:
        return valueFromListAsDouble(atoms[atomIndex].ionizationEnergies, 0);
      case SortProperty.secondIonizationEnergy:
        return valueFromListAsDouble(atoms[atomIndex].ionizationEnergies, 1);
    }
  }

  void propertySorter() {
    sortedList.clear();
    selectedSortPropertyString.value =
        capitalizeAndAddSpaces(selectedSortProperty.value.name);
    for (int i = 0; i < atoms.length; i++) {
      final double? property = getProperty(i);
      if (property == null) continue;
      sortedList.add((symbol: atoms[i].symbol, atomProperty: property));
    }

    // Check if the atomProperty is null before sorting.
    sortedList.sort((a, b) => a.atomProperty!.compareTo(b.atomProperty!));

    // Print the sorted list.
    // print(sortedList);
  }
}
