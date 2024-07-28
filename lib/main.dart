import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'pages/periodictable_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PeriodicTableApp());
}

class PeriodicTableApp extends StatelessWidget {
  const PeriodicTableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: FlexThemeData.dark(
          useMaterial3: true, scheme: FlexScheme.materialBaseline),
      home: const PeriodicTablePage(),
    );
  }
}
