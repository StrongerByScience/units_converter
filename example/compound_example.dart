import 'package:units_converter/units_converter.dart';

void main() {
  // We give 1 meter as input
  var density = Density()..convert(DENSITY.gramsPerMilliliter, 1);
  // We get the inches
  var unit = density.getUnit(DENSITY.gramsPerMilliliter);
  // We print the Unit
  print(
      'name:${unit.name}, value:${unit.value}, stringValue:${unit.stringValue}, symbol:${unit.symbol}');
}
