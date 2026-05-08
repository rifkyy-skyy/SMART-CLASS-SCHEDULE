import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kuliahku/main.dart';

void main() {
  testWidgets('Cek tampilan aplikasi KuliahKu',
      (WidgetTester tester) async {

    // Menjalankan aplikasi
    await tester.pumpWidget(const KuliahKuApp());

    // Mengecek apakah judul muncul
    expect(find.text('SMART CLASS SCHEDULE'), findsOneWidget);

    // Mengecek apakah jadwal muncul
    expect(find.text('Struktur Data'), findsOneWidget);

    // Mengecek tombol tambah ada
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}