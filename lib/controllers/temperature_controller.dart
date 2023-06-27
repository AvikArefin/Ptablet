import 'package:get/get.dart';

class TemperatureController extends GetxController {
  final _currentKTemperature = 273.0.obs;
  // final _currentSliderValue = 0.273.obs;
  double get currentKTemperature => _currentKTemperature.value;
  set currentKTemperature(double value) => _currentKTemperature.value = value;
}
