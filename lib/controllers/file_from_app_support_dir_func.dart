import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future<File> fileFromAppSupportDir(String filename) async {
  Directory appSupportDir = await getApplicationSupportDirectory();
  String pathName = p.join(appSupportDir.path, filename);
  return File(pathName);
}
