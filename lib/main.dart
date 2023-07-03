import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:ptablet/pages/periodictable_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PeriodicTableApp());
}

class PeriodicTableApp extends StatelessWidget {
  const PeriodicTableApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: FlexThemeData.light(
          useMaterial3: true, scheme: FlexScheme.materialBaseline),
      darkTheme: FlexThemeData.dark(
          useMaterial3: true, scheme: FlexScheme.materialBaseline),
      home: PeriodicTablePage(),
    );
  }
}
