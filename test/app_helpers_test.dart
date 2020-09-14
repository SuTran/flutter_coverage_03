import 'package:test/test.dart';

import '../lib/helpers/app_helpers.dart';

void main() {
  AppHelper appHelper = AppHelper();

  test('test to check sub', () {
    var expected = 10;
    // Arrange

    var actual = appHelper.sub(30, 20);
    // Act

    expect(actual, expected);
    // Assert
  });
  test("test to check add method", () {
    var expected = 30;
    // Arrange

    var actual = appHelper.add(10, 20);
    // Act

    expect(actual, expected);
    // Asset
  });
}
