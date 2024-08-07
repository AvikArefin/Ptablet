import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/atom_element_image_widget.dart';
import '../controllers/enum_text_func.dart';
import '../controllers/list_index_func.dart';
import '../data/cas.dart';
import '../models/atom_model.dart';
import 'atom_orbits_page.dart';


class AtomDetailsPage extends StatelessWidget {
  const AtomDetailsPage({super.key, required this.atom});
  final Atom atom;

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(atom.source ?? ''),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch the url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.close)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AtomElementImageWidget(atom: atom),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AtomOrbitsRender(
                                    shells: atom.shells,
                                    electronConfig:
                                        atom.electronConfiguration,
                                  )),
                        );
                      },
                      icon: const Icon(Icons.adjust),
                      label: const Text('Orbitals'),
                    ),
                    ElevatedButton.icon(
                      onPressed: _launchUrl,
                      icon: const Text(
                        'W',
                        style:
                            TextStyle(fontWeight: FontWeight.w100, fontSize: 20),
                      ),
                      label: const Text('Wikipedia'),
                    ),
                  ],
                ),
              ),
              AtomProperties(atom: atom),
            ],
          ),
        ));
  }
}

class AtomProperties extends StatelessWidget {
  const AtomProperties({super.key, required this.atom});
  final Atom atom;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ExpansionTile(
        title: const Text('Note'),
        initiallyExpanded: true,
        children: [
          buildElementProperty(null, atom.summary ?? ''),
        ],
      ),
      ExpansionTile(
        title: const Text('Overview'),
        initiallyExpanded: true,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              'CAS Number: CAS${safeValueFromListAsString(casNum, atom.number - 1)}',
              // style: const TextStyle(color: kWhite),
            ),
          ),
          buildElementProperty(
              'BOIL',
              atom.boil == null
                  ? ''
                  : '${atom.boil!}k = ${atom.boil! - 273.15}C'),
          buildElementProperty(
              'CATEGORY', capitalizeAndAddSpaces(atom.category.name)),
          buildElementProperty('DENSITY', atom.density.toString()),
          buildElementProperty('DISCOVERED BY', atom.discoveredBy ?? ''),
        ],
      ),
      ExpansionTile(
        title: const Text('Electron'),
        initiallyExpanded: true,
        children: [
          buildElementProperty(
              'Electron Configuration', atom.electronConfiguration),
          buildElementProperty(
              'Semantic Configuration', atom.electronConfigurationSemantic),
          buildElementProperty(
              'Electron Affinity', '${atom.electronAffinity}'),
          buildElementProperty('Electronegativity Pauling',
              '${atom.electronegativityPauling}'),
        ],
      ),
    ]);
  }

  Container buildElementProperty(String? title, String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        '${title == null ? '' : '$title : '}$text',
        // style: const TextStyle(color: kWhite),
      ),
    );
  }
}
