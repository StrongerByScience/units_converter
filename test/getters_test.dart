import 'package:test/test.dart';
import 'package:units_converter/properties/si_prefixes.dart';
import 'package:units_converter/units_converter.dart';

void main() {
  void runGetterTest(Unit unit1, Unit unit2) {
    double? val1 = unit1.value;
    double? val2 = unit2.value;
    test('${unit1.name.toString()} test', () {
      expect(val1, val2,
          reason:
              'Failed ${unit1.name.toString()}: $val1 is different from $val2');
    });
  }

  group('Density test', () {
    var property = Density();
    runGetterTest(property.gramsPerMilliliter,
        property.getUnit(DENSITY.gramsPerMilliliter));
  });

  group('Energy test', () {
    var property = Energy();
    property.convert(ENERGY.joules, 1);
    runGetterTest(property.joules, property.getUnit(ENERGY.joules));
    runGetterTest(property.kilojoules, property.getUnit(ENERGY.kilojoules));
    runGetterTest(property.calories, property.getUnit(ENERGY.calories));
    runGetterTest(property.kilocalories, property.getUnit(ENERGY.kilocalories));
  });
  group('Length test', () {
    var property = Length();
    property.convert(LENGTH.meters, 1);
    runGetterTest(property.meters, property.getUnit(LENGTH.meters));
    runGetterTest(property.centimeters, property.getUnit(LENGTH.centimeters));
    runGetterTest(property.inches, property.getUnit(LENGTH.inches));
    runGetterTest(property.feet, property.getUnit(LENGTH.feet));
    runGetterTest(property.feetUs, property.getUnit(LENGTH.feetUs));
    runGetterTest(property.yards, property.getUnit(LENGTH.yards));
    runGetterTest(property.miles, property.getUnit(LENGTH.miles));
    runGetterTest(property.millimeters, property.getUnit(LENGTH.millimeters));
    runGetterTest(property.kilometers, property.getUnit(LENGTH.kilometers));
  });

  group('Mass test', () {
    var property = Mass();
    property.convert(MASS.grams, 1);
    runGetterTest(property.grams, property.getUnit(MASS.grams));
    runGetterTest(property.kilograms, property.getUnit(MASS.kilograms));
    runGetterTest(property.pounds, property.getUnit(MASS.pounds));
    runGetterTest(property.ounces, property.getUnit(MASS.ounces));
    runGetterTest(property.milligrams, property.getUnit(MASS.milligrams));
    runGetterTest(property.stones, property.getUnit(MASS.stones));
    runGetterTest(property.nanograms, property.getUnit(MASS.nanograms));
    runGetterTest(property.micrograms, property.getUnit(MASS.micrograms));
  });

  group('Numeral systems test', () {
    var property = NumeralSystems();
    property.convert(NUMERAL_SYSTEMS.decimal, '1');
    runGetterTest(property.decimal, property.getUnit(NUMERAL_SYSTEMS.decimal));
    runGetterTest(
        property.hexadecimal, property.getUnit(NUMERAL_SYSTEMS.hexadecimal));
    runGetterTest(property.octal, property.getUnit(NUMERAL_SYSTEMS.octal));
    runGetterTest(property.binary, property.getUnit(NUMERAL_SYSTEMS.binary));
  });

  group('SI prefixes test', () {
    var property = SIPrefixes();
    property.convert(SI_PREFIXES.base, 1);
    runGetterTest(property.base, property.getUnit(SI_PREFIXES.base));
    runGetterTest(property.deca, property.getUnit(SI_PREFIXES.deca));
    runGetterTest(property.hecto, property.getUnit(SI_PREFIXES.hecto));
    runGetterTest(property.kilo, property.getUnit(SI_PREFIXES.kilo));
    runGetterTest(property.mega, property.getUnit(SI_PREFIXES.mega));
    runGetterTest(property.giga, property.getUnit(SI_PREFIXES.giga));
    runGetterTest(property.tera, property.getUnit(SI_PREFIXES.tera));
    runGetterTest(property.peta, property.getUnit(SI_PREFIXES.peta));
    runGetterTest(property.exa, property.getUnit(SI_PREFIXES.exa));
    runGetterTest(property.zetta, property.getUnit(SI_PREFIXES.zetta));
    runGetterTest(property.yotta, property.getUnit(SI_PREFIXES.yotta));
    runGetterTest(property.deci, property.getUnit(SI_PREFIXES.deci));
    runGetterTest(property.centi, property.getUnit(SI_PREFIXES.centi));
    runGetterTest(property.milli, property.getUnit(SI_PREFIXES.milli));
    runGetterTest(property.micro, property.getUnit(SI_PREFIXES.micro));
    runGetterTest(property.nano, property.getUnit(SI_PREFIXES.nano));
    runGetterTest(property.pico, property.getUnit(SI_PREFIXES.pico));
    runGetterTest(property.femto, property.getUnit(SI_PREFIXES.femto));
    runGetterTest(property.atto, property.getUnit(SI_PREFIXES.atto));
    runGetterTest(property.zepto, property.getUnit(SI_PREFIXES.zepto));
    runGetterTest(property.yocto, property.getUnit(SI_PREFIXES.yocto));
  });

  group('Temperature test', () {
    var property = Temperature();
    property.convert(TEMPERATURE.fahrenheit, 1);
    runGetterTest(
        property.fahrenheit, property.getUnit(TEMPERATURE.fahrenheit));
    runGetterTest(property.celsius, property.getUnit(TEMPERATURE.celsius));
    runGetterTest(property.kelvin, property.getUnit(TEMPERATURE.kelvin));
  });

  group('Time test', () {
    var property = Time();
    property.convert(TIME.seconds, 1);
    runGetterTest(property.seconds, property.getUnit(TIME.seconds));
    runGetterTest(property.deciseconds, property.getUnit(TIME.deciseconds));
    runGetterTest(property.centiseconds, property.getUnit(TIME.centiseconds));
    runGetterTest(property.milliseconds, property.getUnit(TIME.milliseconds));
    runGetterTest(property.microseconds, property.getUnit(TIME.microseconds));
    runGetterTest(property.nanoseconds, property.getUnit(TIME.nanoseconds));
    runGetterTest(property.minutes, property.getUnit(TIME.minutes));
    runGetterTest(property.hours, property.getUnit(TIME.hours));
    runGetterTest(property.days, property.getUnit(TIME.days));
    runGetterTest(property.weeks, property.getUnit(TIME.weeks));
    runGetterTest(property.years365, property.getUnit(TIME.years365));
    runGetterTest(property.lustrum, property.getUnit(TIME.lustrum));
    runGetterTest(property.decades, property.getUnit(TIME.decades));
    runGetterTest(property.centuries, property.getUnit(TIME.centuries));
    runGetterTest(property.millennium, property.getUnit(TIME.millennium));
  });

  group('Volume test', () {
    var property = Volume();
    property.convert(VOLUME.cubicMeters, 1);
    runGetterTest(property.cubicMeters, property.getUnit(VOLUME.cubicMeters));
    runGetterTest(property.liters, property.getUnit(VOLUME.liters));
    runGetterTest(
        property.imperialGallons, property.getUnit(VOLUME.imperialGallons));
    runGetterTest(property.usGallons, property.getUnit(VOLUME.usGallons));
    runGetterTest(
        property.imperialPints, property.getUnit(VOLUME.imperialPints));
    runGetterTest(
        property.imperialQuarts, property.getUnit(VOLUME.imperialQuarts));
    runGetterTest(property.usPints, property.getUnit(VOLUME.usPints));
    runGetterTest(property.milliliters, property.getUnit(VOLUME.milliliters));
    runGetterTest(
        property.tablespoonsUs, property.getUnit(VOLUME.tablespoonsUs));
    runGetterTest(property.australianTablespoons,
        property.getUnit(VOLUME.australianTablespoons));
    runGetterTest(property.cups, property.getUnit(VOLUME.cups));
    runGetterTest(
        property.cubicCentimeters, property.getUnit(VOLUME.cubicCentimeters));
    runGetterTest(property.cubicFeet, property.getUnit(VOLUME.cubicFeet));
    runGetterTest(property.cubicInches, property.getUnit(VOLUME.cubicInches));
    runGetterTest(
        property.cubicMillimeters, property.getUnit(VOLUME.cubicMillimeters));
    runGetterTest(property.imperialFluidOunces,
        property.getUnit(VOLUME.imperialFluidOunces));
    runGetterTest(
        property.usFluidOunces, property.getUnit(VOLUME.usFluidOunces));
    runGetterTest(property.usQuarts, property.getUnit(VOLUME.usQuarts));
    runGetterTest(property.femtoliter, property.getUnit(VOLUME.femtoliters));
    runGetterTest(property.picoliter, property.getUnit(VOLUME.picoliters));
    runGetterTest(property.nanoliter, property.getUnit(VOLUME.nanoliters));
    runGetterTest(property.microliter, property.getUnit(VOLUME.microliters));
    runGetterTest(property.deciliter, property.getUnit(VOLUME.deciliters));
    runGetterTest(property.centiliter, property.getUnit(VOLUME.centiliters));
  });
}
