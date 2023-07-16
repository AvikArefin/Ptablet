import 'package:get/get.dart';

class TemperatureController extends GetxController {
  final _currentKTemperature = 273.0.obs;

  double get currentKTemperature => _currentKTemperature.value;
  double get currentCTemperature => (_currentKTemperature.value - 273.15).toPrecision(2);
  double get currentFTemperature => (_currentKTemperature.value - 273.15)*1.8 + 32;
  set currentKTemperature(double value) => _currentKTemperature.value = value;
}
