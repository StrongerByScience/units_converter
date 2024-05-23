import 'package:test/test.dart';
import 'package:units_converter/properties/si_prefixes.dart';
import 'package:units_converter/units_converter.dart';

/// This function defines if a value is acceptable. e.g. if we expect to have 1 but we get 1.00000000012, is this a valid result or not?
/// The term sensibility is used improperly.
bool isAcceptable(double? convertedValue, double? expectedValue, sensibility) {
  if ((convertedValue == null && expectedValue != null) ||
      (convertedValue != null && expectedValue == null)) {
    return false;
  }
  final double accuracy = expectedValue! / sensibility;
  final double upperConstraint = expectedValue + accuracy;
  final double lowerConstraint = expectedValue - accuracy;
  return convertedValue! >= lowerConstraint &&
      convertedValue <= upperConstraint;
}

void runConversionTest(Map<dynamic, double> expectedResult, Property property,
    {double sensibility = 1e10}) {
  final List listNames = expectedResult.keys.toList();
  for (var unitName in listNames) {
    test('Test from ${unitName.toString()}', () {
      property.convert(unitName, expectedResult[unitName]);
      List<Unit> unitList = property.getAll();
      for (Unit unit in unitList) {
        var name = unit.name;
        double? convertedValue =
            unitList.where((element) => element.name == name).single.value;
        expect(
          isAcceptable(convertedValue, expectedResult[name]!, sensibility),
          true,
          reason:
              'Error with ${name.toString()}. Expected: ${expectedResult[name]}, result: $convertedValue',
        );
      }
    });
  }
  for (var unitName in listNames) {
    test('Test from ${unitName.toString()}', () {
      property.convert(unitName, null);
      List<Unit> unitList = property.getAll();
      for (Unit unit in unitList) {
        var name = unit.name;
        double? convertedValue =
            unitList.where((element) => element.name == name).single.value;
        expect(
          convertedValue,
          null,
          reason:
              'Error with ${name.toString()}. Expected: null, result: $convertedValue',
        );
      }
    });
  }
}

void main() {
  group('Density conversion', () {
    const Map<DENSITY, double> expectedResult = {
      DENSITY.gramsPerMilliliter: 0.001,
    };
    runConversionTest(expectedResult, Density());
  });

  group('Energy', () {
    const Map<ENERGY, double> expectedResult = {
      ENERGY.joules: 1,
      ENERGY.kilojoules: 1e-3,
      ENERGY.calories: 0.2388459,
      ENERGY.kilocalories: 0.0002388459,
    };
    runConversionTest(expectedResult, Energy());
  });

  group('Length', () {
    const Map<LENGTH, double> expectedResult = {
      LENGTH.meters: 1,
      LENGTH.centimeters: 100,
      LENGTH.inches: 39.370078740157,
      LENGTH.feet: 3.2808398950131,
      LENGTH.feetUs: 3.280833333346457,
      LENGTH.yards: 1.0936132983377,
      LENGTH.miles: 0.00062137119223733,
      LENGTH.millimeters: 1e3,
      LENGTH.kilometers: 1e-3,
    };
    runConversionTest(expectedResult, Length());
  });

  group('Mass', () {
    const Map<MASS, double> expectedResult = {
      MASS.grams: 1,
      MASS.kilograms: 1e-3,
      MASS.pounds: 0.0022046226218488,
      MASS.ounces: 0.03527396194958,
      MASS.milligrams: 1e3,
      MASS.stones: 0.0001574730444,
      MASS.nanograms: 1e9,
      MASS.micrograms: 1e6,
    };
    runConversionTest(expectedResult, Mass(), sensibility: 1e9);
  });

  group('Numeral systems', () {
    const Map<NUMERAL_SYSTEMS, String> expectedResult = {
      NUMERAL_SYSTEMS.decimal: '178897',
      NUMERAL_SYSTEMS.hexadecimal: '2BAD1',
      NUMERAL_SYSTEMS.octal: '535321',
      NUMERAL_SYSTEMS.binary: '101011101011010001',
    };
    NumeralSystems property = NumeralSystems();
    final List listNames = expectedResult.keys.toList();
    for (var unitName in listNames) {
      test('Test from ${unitName.toString()}', () {
        property.convert(unitName, expectedResult[unitName]);
        List<Unit> unitList = property.getAll();
        for (Unit unit in unitList) {
          var name = unit.name;
          String? convertedValue = unitList
              .where((element) => element.name == name)
              .single
              .stringValue!;
          expect(
            convertedValue,
            expectedResult[name],
            reason:
                'Error with ${name.toString()}. Expected: ${expectedResult[name]}, result: $convertedValue',
          );
        }
      });
      property.convert(listNames[0], null); //clear all values
    }
    for (var unitName in listNames) {
      test('Test from ${unitName.toString()}', () {
        property.convert(unitName, null);
        List<Unit> unitList = property.getAll();
        for (Unit unit in unitList) {
          var name = unit.name;
          String? convertedValue = unitList
              .where((element) => element.name == name)
              .single
              .stringValue;
          expect(
            convertedValue,
            null,
            reason:
                'Error with ${name.toString()}. Expected: null, result: $convertedValue',
          );
        }
      });
    }
  });

  group('SI prefixes', () {
    const Map<SI_PREFIXES, double> expectedResult = {
      SI_PREFIXES.base: 1,
      SI_PREFIXES.deca: 1e-1,
      SI_PREFIXES.hecto: 1e-2,
      SI_PREFIXES.kilo: 1e-3,
      SI_PREFIXES.mega: 1e-6,
      SI_PREFIXES.giga: 1e-9,
      SI_PREFIXES.tera: 1e-12,
      SI_PREFIXES.peta: 1e-15,
      SI_PREFIXES.exa: 1e-18,
      SI_PREFIXES.zetta: 1e-21,
      SI_PREFIXES.yotta: 1e-24,
      SI_PREFIXES.deci: 1e1,
      SI_PREFIXES.centi: 1e2,
      SI_PREFIXES.milli: 1e3,
      SI_PREFIXES.micro: 1e6,
      SI_PREFIXES.nano: 1e9,
      SI_PREFIXES.pico: 1e12,
      SI_PREFIXES.femto: 1e15,
      SI_PREFIXES.atto: 1e18,
      SI_PREFIXES.zepto: 1e21,
      SI_PREFIXES.yocto: 1e24,
    };
    runConversionTest(expectedResult, SIPrefixes());
  });

  group('Temperature', () {
    const Map<TEMPERATURE, double> expectedResult = {
      TEMPERATURE.fahrenheit: 33.8,
      TEMPERATURE.celsius: 1,
      TEMPERATURE.kelvin: 274.15,
    };
    runConversionTest(expectedResult, Temperature());
  });

  group('Time', () {
    const Map<TIME, double> expectedResult = {
      TIME.seconds: 1,
      TIME.deciseconds: 10,
      TIME.centiseconds: 100,
      TIME.milliseconds: 1e3,
      TIME.microseconds: 1e6,
      TIME.nanoseconds: 1e9,
      TIME.minutes: 1 / 60,
      TIME.hours: 1 / (60 * 60),
      TIME.days: 1 / (60 * 60 * 24),
      TIME.weeks: 1 / (60 * 60 * 24 * 7),
      TIME.years365: 1 / (60 * 60 * 24 * 365),
      TIME.lustrum: 1 / (60 * 60 * 24 * 365 * 5),
      TIME.decades: 1 / (60 * 60 * 24 * 365 * 10),
      TIME.centuries: 1 / (60 * 60 * 24 * 365 * 100),
      TIME.millennium: 1 / (60 * 60 * 24 * 365 * 1000),
    };
    runConversionTest(expectedResult, Time());
  });

  group('Volume', () {
    const Map<VOLUME, double> expectedResult = {
      VOLUME.cubicMeters: 1,
      VOLUME.liters: 1e3,
      VOLUME.imperialGallons: 219.96924829909,
      VOLUME.usGallons: 264.17205235815,
      VOLUME.imperialPints: 1759.7539863927,
      VOLUME.imperialQuarts: 879.876993196,
      VOLUME.usPints: 2113.3764188652,
      VOLUME.milliliters: 1e6,
      VOLUME.tablespoonsUs: 67567.567567568,
      VOLUME.australianTablespoons: 50000,
      VOLUME.cups: 4166.6666666667,
      VOLUME.cubicCentimeters: 1e6,
      VOLUME.cubicFeet: 35.314666721489,
      VOLUME.cubicInches: 61023.744094732,
      VOLUME.cubicMillimeters: 1e9,
      VOLUME.imperialFluidOunces: 35195.07973,
      VOLUME.usFluidOunces: 33814.0227,
      VOLUME.usQuarts: 1056.6882094325938,
      VOLUME.femtoliters: 1e18,
      VOLUME.picoliters: 1e15,
      VOLUME.nanoliters: 1e12,
      VOLUME.microliters: 1e9,
      VOLUME.deciliters: 1e4,
      VOLUME.centiliters: 1e5,
    };
    runConversionTest(expectedResult, Volume(), sensibility: 1e9);
  });

  group('Simple custom conversion', () {
    const Map<String, double> expectedResult = {
      'EUR': 1,
      'CAD': 1.5213,
      'HKD': 9.3363,
      'RUB': 88.6563,
      'USD': 1.2034,
      'GBP': 0.8627,
    };
    const Map<String, String> mapSymbol = {
      'EUR': '€',
      'CAD': '\$',
      'HKD': 'HK\$',
      'RUB': '₽',
      'USD': '\$',
      'GBP': '£',
    };
    runConversionTest(expectedResult,
        SimpleCustomProperty(expectedResult, mapSymbols: mapSymbol));
    // We use it with null symbols
    var conversion = SimpleCustomProperty(expectedResult)..convert('EUR', 1);
    // test single units
    expectedResult.forEach((key, value) {
      test(
        'Test single unit: $key',
        () {
          expect(isAcceptable(conversion.getUnit(key).value, value, 1e10), true,
              reason: 'Failed single unit test:($key)');
        },
      );
    });
  });
}
