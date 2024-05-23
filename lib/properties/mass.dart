import 'package:units_converter/models/conversion_node.dart';
import 'package:units_converter/models/double_property.dart';
import 'package:units_converter/models/property.dart';
import 'package:units_converter/models/unit.dart';

//Available MASS units
enum MASS {
  grams,
  kilograms,
  pounds,
  ounces,
  milligrams,
  nanograms,
  micrograms,

  /// unified atomic mass unit
  stones,
}

class Mass extends DoubleProperty<MASS> {
  ///Class for mass conversions, e.g. if you want to convert 1 gram in ounces:
  ///```dart
  ///var mass = Mass(removeTrailingZeros: false);
  ///mass.convert(Unit(MASS.grams, value: 1));
  ///print(MASS.ounces);
  /// ```
  Mass(
      {super.significantFigures,
      super.removeTrailingZeros,
      super.useScientificNotation,
      name})
      : super(
          name: name ?? PROPERTY.mass,
          mapSymbols: {
            MASS.grams: 'g',
            MASS.kilograms: 'kg',
            MASS.pounds: 'lb',
            MASS.ounces: 'oz',
            MASS.milligrams: 'mg',
            MASS.stones: 'st.',
            MASS.nanograms: 'ng',
            MASS.micrograms: 'µg',
          },
          conversionTree: ConversionNode(
            name: MASS.grams,
            children: [
              ConversionNode(
                coefficientProduct: 1000.0,
                name: MASS.kilograms,
                children: [
                  ConversionNode(
                    coefficientProduct: 0.45359237,
                    name: MASS.pounds,
                    children: [
                      ConversionNode(
                        coefficientProduct: 1 / 16,
                        name: MASS.ounces,
                      ),
                      ConversionNode(
                        coefficientProduct: 14,
                        name: MASS.stones,
                      ),
                    ],
                  ),
                ],
              ),
              ConversionNode(
                coefficientProduct: 1e-3,
                name: MASS.milligrams,
              ),
              ConversionNode(
                coefficientProduct: 1e-9,
                name: MASS.nanograms,
              ),
              ConversionNode(
                coefficientProduct: 1e-6,
                name: MASS.micrograms,
              ),
            ],
          ),
        );

  Unit get grams => getUnit(MASS.grams);
  Unit get kilograms => getUnit(MASS.kilograms);
  Unit get pounds => getUnit(MASS.pounds);
  Unit get ounces => getUnit(MASS.ounces);
  Unit get milligrams => getUnit(MASS.milligrams);
  Unit get stones => getUnit(MASS.stones);
  Unit get nanograms => getUnit(MASS.nanograms);
  Unit get micrograms => getUnit(MASS.micrograms);
}
