import 'package:flutter/material.dart';
import 'package:ptablet/components/temperature_widget.dart';

import 'atom_group_menu.dart';
import 'property_menu.dart';

class OptionsSheet extends StatelessWidget {
  const OptionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              PropertyMenu(),
              const SizedBox(height: 16),
              AtomGroupMenu(),
              const SizedBox(height: 16),
              TemperatureWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
