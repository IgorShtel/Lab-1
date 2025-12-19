import 'package:flutter/material.dart';

void main() => runApp(const Lab6Variant8App());

class Lab6Variant8App extends StatelessWidget {
  const Lab6Variant8App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Lab6Variant8Screen(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class Lab6Variant8Screen extends StatelessWidget {
  const Lab6Variant8Screen({super.key});

  // === Варіант 8 (з таблиці) ===
  static const double a = 150; // ширина лівого блоку
  static const double d = 250; // висота верхнього лівого блоку
  static const double h = 400; // висота середнього правого блоку
  static const double k = 250; // ширина нижнього правого лівого блоку
  static const double m = 300; // ширина нижнього правого правого блоку
  // c=min; i=min -> робимо мінімальні відступи/розміри (тобто 0)
  static const double cMin = 0;
  static const double iMin = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ЛР6 — Варіант 8')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // === ЛІВА КОЛОНКА (a, d) ===
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: a),
                    child: Column(
                      children: [
                        Container(
                          height: d,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Душу, тіло\nми положим за\nнашу свободу.',
                              textAlign: TextAlign.justify, // текст по ширині
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'І покажем, що ми, браття,\nкозацького роду.',
                            textAlign: TextAlign.justify, // текст по ширині
                          ),
                        ),
                      ],
                    ),
                  ),

                  // мінімальний “c / i” проміжок
                  SizedBox(width: cMin + iMin),

                  // === ПРАВА ЧАСТИНА (Expanded) ===
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Середній великий блок (h)
                        Container(
                          height: h,
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              'Згинуть наші вороженьки,\n'
                              'як роса на сонці,\n'
                              'запануєм і ми, браття, у\n'
                              'своїй сторонці.',
                              textAlign: TextAlign.justify, // текст по ширині
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Нижній ряд з двох блоків (k, m)
                        Row(
                          children: [
                            ConstrainedBox(
                              constraints:
                                  const BoxConstraints.tightFor(width: k),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'Ще не вмерла\nУкраїна, і\nслава, і воля,',
                                  textAlign: TextAlign.justify, // текст по ширині
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ConstrainedBox(
                              constraints:
                                  const BoxConstraints.tightFor(width: m),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'ще нам, браття\nмолодії',
                                  textAlign: TextAlign.justify, // текст по ширині
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
