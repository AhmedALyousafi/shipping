import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'uploaded_document_card.dart';

void main() {
  group('UploadedDocumentCard', () {
    testWidgets('renders correctly with valid image path',
        (WidgetTester tester) async {
      bool closePressed = false;

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: UploadedDocumentCard(
            imagePath: 'assets/images/document.png',
            onClose: () {
              closePressed = true;
            },
          ),
        ),
      );

      expect(find.text('Uploaded Document'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);

      await tester.tap(find.byType(InkWell));
      expect(closePressed, true);
    });

    testWidgets('shows error icon when image fails to load',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: UploadedDocumentCard(
            imagePath: 'invalid_path.png',
            onClose: () {},
          ),
        ),
      );

      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });
  });
}
