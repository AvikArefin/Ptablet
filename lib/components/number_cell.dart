import 'package:flutter/material.dart';

class NumberCell extends StatelessWidget {
  final int value;
  final double width;
  final double height;

  const NumberCell({
    super.key,
    required this.value,
    this.width = 20,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Text(
        textAlign: TextAlign.center,
        '$value',
      ),
    );
  }
}
