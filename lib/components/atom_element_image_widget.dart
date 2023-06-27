import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:network_to_file_image/network_to_file_image.dart';
import 'package:periodictable/constants/constants.dart';
import 'package:periodictable/controllers/file_from_app_support_dir_func.dart';
import 'package:periodictable/models/atom_model.dart';

class AtomElementImageWidget extends StatelessWidget {
  const AtomElementImageWidget({super.key, required this.atom});
  final Atom atom;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: FutureBuilder(
              future: fileFromAppSupportDir(atom.name),
              builder: ((context, atomImageSnapshot) {
                return Image(
                  image: NetworkToFileImage(
                    file: atomImageSnapshot.data,
                    url: atom.image?.url,
                  ),
                );
              })),
        ),
        Positioned(
          left: 8,
          bottom: 8,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: kShadow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(atom.name,
                    style: GoogleFonts.jost(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(atom.symbol,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 60)),
                    Text('${atom.number}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                Text('${atom.atomicMass.toString()} (g/mol)',
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
        ),
        (atom.appearance.isEmpty)
            ? Container()
            : Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Container(
                    color: kShadow,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        atom.appearance,
                        style: GoogleFonts.jost(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
