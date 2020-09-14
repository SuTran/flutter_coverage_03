import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_coverage/widgets/circle_container_widget.dart';
import './material_test_widget.dart';

void main() {
  testWidgets('should render correctly', (WidgetTester tester) async {
    // Given
    final widget = CircleContainerWidget();

    // When
    await tester.pumpWidget(makeTestableWidget(child: widget));
    final widgetPredicate = (Widget widget) =>
        widget is Container &&
        widget.decoration ==
            BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100),
            );

    // Then
    expect(find.byWidgetPredicate(widgetPredicate), findsOneWidget);
  });
}
