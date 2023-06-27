import 'dart:convert';
import 'dart:io';

import 'package:periodictable/models/atom_model.dart';

void main() {
  // Read JSON file
  File jsonFile = File('PeriodicTableJSON.json');
  String jsonString = jsonFile.readAsStringSync();

  // Parse JSON
  Map<String, dynamic> jsonData = jsonDecode(jsonString);
  List<dynamic> jsonElements = jsonData['elements'];

  // Create Dart objects
  // List<Element> elements = jsonElements
  //     .map((jsonObject) => Element.fromJson(jsonObject))
  //     .toSet()
  //     .toList();

  // Create Dart Objects selectively
  // Create Dart objects
  List<Atom> elements = [];
  Set<int> atomicNumbers = <int>{};

  for (var jsonObject in jsonElements) {
    Atom element = Atom.fromJson(jsonObject);
    if (!atomicNumbers.contains(element.number)) {
      elements.add(element);
      atomicNumbers.add(element.number);
    }
  }

  // Generate Dart code
  String dartCode = '''
  import 'package:periodictable/models/atom_model.dart';
  List<Atom> atoms = [
    ${elements.map((element) => 'Atom('
          'name: "${element.name}", '
          'appearance: "${element.appearance}", '
          'atomicMass: ${element.atomicMass}, '
          'boil: ${element.boil}, '
          'category: ${element.category}, '
          'density: ${element.density}, '
          'discoveredBy: "${element.discoveredBy}", '
          'melt: ${element.melt}, '
          'molarHeat: ${element.molarHeat}, '
          'namedBy: "${element.namedBy}", '
          'number: ${element.number}, '
          // 'period: ${element.period}, '
          // 'group: ${element.group}, '
          // 'phase: "${element.phase}", '
          'source: \'${element.source}\', '
          // 'bohrModelImage: "${element.bohrModelImage}", '
          // 'bohrModel3d: "${element.bohrModel3d}", '
          // 'spectralImg: "${element.spectralImg}", '
          'summary: ${jsonEncode(element.summary)}, '
          'symbol: "${element.symbol}", '
          'xpos: ${element.xpos}, '
          'ypos: ${element.ypos}, '
          // 'wxpos: ${element.wxpos}, '
          // 'wypos: ${element.wypos}, '
          'shells: ${element.shells}, '
          'electronConfiguration: "${element.electronConfiguration}", '
          'electronConfigurationSemantic: "${element.electronConfigurationSemantic}", '
          'electronAffinity: ${element.electronAffinity}, '
          'electronegativityPauling: ${element.electronegativityPauling}, '
          'ionizationEnergies: ${element.ionizationEnergies}, '
          // 'cpkHex: "${element.cpkHex}", '
          'image: ImageInfo('
          'title: "${element.image?.title}", '
          'url: "${element.image?.url}", '
          'attribution: "${element.image?.attribution}"'
          '), '
          // 'block: "${element.block}"'
          ')').join(',\n')}
  ];
  ''';

  // Save Dart file
  File dartFile = File('periodictable_data.dart');
  dartFile.writeAsStringSync(dartCode);

  print('Dart file generated successfully!');
}
