import 'dart:math';
import 'package:flutter/material.dart';

class AtomOrbitsRender extends StatelessWidget {
  const AtomOrbitsRender(
      {super.key, required this.shells, required this.electronConfig});
  final List<int> shells;
  final String electronConfig;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(Icons.close)),
      body: Stack(
        children: [
          const Positioned.fill(
            top: 70,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text('Orbital Electrons Approximation'),
            ),
          ),
          Center(
            child: CustomPaint(
              painter: OpenPainter(shells),
            ),
          ),
          Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(electronConfig),
            ),
          ),
        ],
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  OpenPainter(this.points) : orbitNum = points.length;
  final List<int> points;
  final int orbitNum;

  static const constCircleRadius = 150.0;
  static const center = Offset(0, 0);

  List<Offset> pointsPosition = <Offset>[];

  @override
  void paint(Canvas canvas, Size size) {
    // print('orbits rendered');

    // The orbits
    var paint1 = Paint()
      ..color = const Color.fromARGB(255, 147, 45, 231)
      ..style = PaintingStyle.stroke;

    double variableCircleRadius = 20;
    for (int i = 0; i < orbitNum; i++) {
      // Point for each circle
      pointsPosition +=
          getPointsOnCircle(center, variableCircleRadius, points[i]);

      // Circle for each orbit
      canvas.drawCircle(center, variableCircleRadius, paint1);
      variableCircleRadius += 18;
    }

    // Draw the points
    var paint2 = Paint()
      ..color = const Color.fromARGB(255, 147, 45, 231)
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    double dotRadius = 5.0;
    for (int i = 0; i < pointsPosition.length; i++) {
      canvas.drawCircle(pointsPosition[i], dotRadius, paint2);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Offset Calculation
List<Offset> getPointsOnCircle(Offset center, double radius, int numPoints) {
  List<Offset> points = [];

  double angleStep = 2 * pi / numPoints;
  for (int i = 0; i < numPoints; i++) {
    double angle = i * angleStep;
    double x = radius * cos(angle);
    double y = radius * sin(angle);
    Offset point = Offset(center.dx + x, center.dy + y);
    points.add(point);
  }

  return points;
}
