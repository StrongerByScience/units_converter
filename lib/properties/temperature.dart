import 'package:units_converter/models/conversion_node.dart';
import 'package:units_converter/models/double_property.dart';
import 'package:units_converter/models/property.dart';
import 'package:units_converter/models/unit.dart';

//Available TEMPERATURE units
enum TEMPERATURE {
  fahrenheit,
  celsius,
  kelvin,
}

class Temperature extends DoubleProperty<TEMPERATURE> {
  ///Class for temperature conversions, e.g. if you want to convert 1 celsius in kelvin:
  ///```dart
  ///var temperature = Temperature(removeTrailingZeros: false);
  ///temperature.convert(Unit(TEMPERATURE.celsius, value: 1));
  ///print(TEMPERATURE.kelvin);
  /// ```
  Temperature(
      {super.significantFigures,
      super.removeTrailingZeros,
      super.useScientificNotation,
      name})
      : super(
          name: name ?? PROPERTY.temperature,
          mapSymbols: {
            TEMPERATURE.fahrenheit: '°F',
            TEMPERATURE.celsius: '°C',
            TEMPERATURE.kelvin: 'K',
          },
          conversionTree: ConversionNode(
            name: TEMPERATURE.fahrenheit,
            children: [
              ConversionNode(
                coefficientProduct: 1.8,
                coefficientSum: 32.0,
                name: TEMPERATURE.celsius,
                children: [
                  ConversionNode(
                    coefficientSum: -273.15,
                    name: TEMPERATURE.kelvin,
                  ),
                ],
              ),
            ],
          ),
        );

  Unit get fahrenheit => getUnit(TEMPERATURE.fahrenheit);
  Unit get celsius => getUnit(TEMPERATURE.celsius);
  Unit get kelvin => getUnit(TEMPERATURE.kelvin);
}
