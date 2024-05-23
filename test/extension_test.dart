import 'package:test/test.dart';
import 'package:units_converter/units_converter.dart';

void main() {
  test('Extension on num', () {
    expect(1.convertFromTo(ENERGY.kilocalories, ENERGY.calories), 1e3);
    expect(1.convertFromTo(LENGTH.feet, LENGTH.meters), 0.3048);
    expect(1.convertFromTo(MASS.kilograms, MASS.grams), 1e3);
    expect(1.convertFromTo(TEMPERATURE.celsius, TEMPERATURE.fahrenheit), 33.8);
    expect(1.convertFromTo(TIME.hours, TIME.minutes), 60);
    expect(1.convertFromTo(VOLUME.cubicMeters, VOLUME.liters), 1e3);
    expect(() {
      1.convertFromTo('This unit does not exists', 'another unit');
    }, throwsA(isA<AssertionError>()));
  });

  test('Extension on String', () {
    expect(
        '10001011'
            .convertFromTo(NUMERAL_SYSTEMS.binary, NUMERAL_SYSTEMS.hexadecimal),
        '8B');
  });
}
