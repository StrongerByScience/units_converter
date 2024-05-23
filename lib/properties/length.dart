import 'package:units_converter/models/conversion_node.dart';
import 'package:units_converter/models/double_property.dart';
import 'package:units_converter/models/property.dart';
import 'package:units_converter/models/unit.dart';

//Available length units
enum LENGTH {
  meters,
  centimeters,
  inches,
  feet,
  feetUs,
  yards,
  miles,
  millimeters,
  kilometers,
}

class Length extends DoubleProperty<LENGTH> {
  ///Class for length conversions, e.g. if you want to convert 1 meter in inches:
  ///```dart
  ///var length = Length(removeTrailingZeros: false);
  ///length.convert(Unit(LENGTH.meters, value: 1));
  ///print(length.inches);
  /// ```
  Length(
      {super.significantFigures,
      super.removeTrailingZeros,
      super.useScientificNotation,
      name})
      : super(
          name: name ?? PROPERTY.length,
          mapSymbols: {
            LENGTH.meters: 'm',
            LENGTH.centimeters: 'cm',
            LENGTH.inches: 'in',
            LENGTH.feet: 'ft',
            LENGTH.feetUs: 'ft(US survey)',
            LENGTH.yards: 'yd',
            LENGTH.miles: 'mi',
            LENGTH.millimeters: 'mm',
            LENGTH.kilometers: 'km',
          },
          conversionTree: ConversionNode(
            name: LENGTH.meters,
            children: [
              ConversionNode(
                coefficientProduct: 0.01,
                name: LENGTH.centimeters,
                children: [
                  ConversionNode(
                    coefficientProduct: 2.54,
                    name: LENGTH.inches,
                    children: [
                      ConversionNode(
                        coefficientProduct: 12.0,
                        name: LENGTH.feet,
                      ),
                      ConversionNode(
                        coefficientProduct: 12.000024,
                        name: LENGTH.feetUs,
                      ),
                    ],
                  ),
                ],
              ),
              ConversionNode(
                  coefficientProduct: 0.9144,
                  name: LENGTH.yards,
                  children: [
                    ConversionNode(
                      coefficientProduct: 1760.0,
                      name: LENGTH.miles,
                    ),
                  ]),
              ConversionNode(
                coefficientProduct: 1e-3,
                name: LENGTH.millimeters,
              ),
              ConversionNode(
                coefficientProduct: 1000.0,
                name: LENGTH.kilometers,
              ),
            ],
          ),
        );

  Unit get meters => getUnit(LENGTH.meters);
  Unit get centimeters => getUnit(LENGTH.centimeters);
  Unit get inches => getUnit(LENGTH.inches);
  Unit get feet => getUnit(LENGTH.feet);
  Unit get feetUs => getUnit(LENGTH.feetUs);
  Unit get yards => getUnit(LENGTH.yards);
  Unit get miles => getUnit(LENGTH.miles);
  Unit get millimeters => getUnit(LENGTH.millimeters);
  Unit get kilometers => getUnit(LENGTH.kilometers);
}
