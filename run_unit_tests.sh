#!/usr/bin/env bash
outputFile="$(pwd)/test/coverage_test.dart"
packageName="$(cat pubspec.yaml | grep '^name: ' | awk '{print $2}')"

if [ -d "coverage" ]; then
  rm -rf "coverage"
fi

if [ -f $outputFile ]; then
  rm -f $outputFile
fi

if [ "$packageName" = "" ]; then
  echo "Run $0 from the root of your Dart/Flutter project"
  exit 1
fi
# Generates a dart file of all project files which should be covered by unit tests.
find lib -name '*.dart' | grep -v '.g.dart' | grep -v 'generated_plugin_registrant' | awk -v package=$packageName '{gsub("^lib", "", $1); printf("import '\''package:%s%s'\'';\n", package, $1);}' >>"$outputFile"
echo "void main() {}" >>"$outputFile"

# generate lcov
flutter test --coverage
lcov --remove coverage/lcov.info "lib/generated/*" -o coverage/lcov_cleaned.info

# Generates the coverage report and open file index.html after run finished
genhtml coverage/lcov.info -o coverage --no-function-coverage -s -p $(pwd)

if [ "$1" != "skip_open_report" ]; then
  open coverage/index.html
fi
