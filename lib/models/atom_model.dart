enum AtomCategory {
  diatomicNonmetal,
  nobleGas,
  alkaliMetal,
  alkalineEarthMetal,
  transitionMetal,
  lanthanide,
  actinide,
  postTransisionMetal,
  metalloid,
}

class Atom {
  final String name;
  final String appearance;
  final double? atomicMass;
  final double? boil;
  final AtomCategory category;
  final double? density;
  final String? discoveredBy;
  final double? melt;
  final double? molarHeat;
  final String? namedBy;
  final int number;
  // final int period;
  // final int group;
  // final String phase;
  final String? source;
  // final String bohrModelImage;
  // final String bohrModel3d;
  // final String spectralImg;
  final String? summary;
  final String symbol;
  final int xpos;
  final int ypos;
  // final int wxpos;
  // final int wypos;
  final List<int> shells;
  final String electronConfiguration;
  final String electronConfigurationSemantic;
  final double? electronAffinity;
  final double? electronegativityPauling;
  final List<double>? ionizationEnergies;
  // final String cpkHex;
  final ImageInfo? image;
  // final String block;

  Atom({
    required this.name,
    required this.appearance,
    this.atomicMass,
    this.boil,
    required this.category,
    this.density,
    this.discoveredBy,
    this.melt,
    this.molarHeat,
    this.namedBy,
    required this.number,
    // required this.period,
    // required this.group,
    // required this.phase,
    this.source,
    // required this.bohrModelImage,
    // required this.bohrModel3d,
    // required this.spectralImg,
    this.summary,
    required this.symbol,
    required this.xpos,
    required this.ypos,
    // required this.wxpos,
    // required this.wypos,
    required this.shells,
    required this.electronConfiguration,
    required this.electronConfigurationSemantic,
    this.electronAffinity,
    this.electronegativityPauling,
    this.ionizationEnergies,
    // this.cpkHex,
    this.image,
    // required this.block,
  });

  factory Atom.fromJson(Map<String, dynamic> json) {
    AtomCategory category;
    String categoryString = json['category'];
    switch (categoryString) {
      case 'diatomic nonmetal':
        category = AtomCategory.diatomicNonmetal;
      case 'noble gas':
        category = AtomCategory.nobleGas;
      case 'alkali metal':
        category = AtomCategory.alkaliMetal;
      case 'alkaline earth metal':
        category = AtomCategory.alkalineEarthMetal;
      case 'transition metal':
        category = AtomCategory.transitionMetal;
      case 'lanthanide':
        category = AtomCategory.lanthanide;
      case 'actinide':
        category = AtomCategory.actinide;
      case 'post-transition metal':
        category = AtomCategory.postTransisionMetal;
      case 'metalloid':
        category = AtomCategory.metalloid;
      default:
        category = AtomCategory.nobleGas;
    }
    return Atom(
      name: json['name'],
      appearance: json['appearance'] ?? '',
      atomicMass: json['atomic_mass']?.toDouble(),
      boil: json['boil']?.toDouble(),
      category: category,
      density: json['density']?.toDouble(),
      discoveredBy: json['discovered_by'] ?? '',
      melt: json['melt']?.toDouble(),
      molarHeat:
          json['molar_heat'] != null ? json['molar_heat'].toDouble() : 0.0,
      namedBy: json['named_by'] ?? '',
      number: json['number'],
      // period: json['period'],
      // group: json['group'],
      // phase: json['phase'],
      source: json['source'],
      // bohrModelImage: json['bohr_model_image'],
      // bohrModel3d: json['bohr_model_3d'],
      // spectralImg: json['spectral_img'],
      summary: json['summary'],
      symbol: json['symbol'],
      xpos: json['xpos'],
      ypos: json['ypos'],
      // wxpos: json['wxpos'],
      // wypos: json['wypos'],
      shells: List<int>.from(json['shells']),
      electronConfiguration: json['electron_configuration'],
      electronConfigurationSemantic: json['electron_configuration_semantic'],
      electronAffinity: json['electron_affinity']?.toDouble(),
      electronegativityPauling: json['electronegativity_pauling']?.toDouble(),
      ionizationEnergies: List<double>.from(
          json['ionization_energies']?.map((e) => e.toDouble())),
      // cpkHex: json['cpk-hex'],
      image: ImageInfo.fromJson(json['image']),
      // block: json['block'],
    );
  }

  // Handle the enums
}

class ImageInfo {
  final String title;
  final String url;
  final String attribution;

  ImageInfo({
    required this.title,
    required this.url,
    required this.attribution,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      title: json['title'],
      url: json['url'],
      attribution: json['attribution'],
    );
  }
}
