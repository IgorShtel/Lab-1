import 'package:flutter/material.dart';

void main() {
  runApp(const Lab8App());
}

/// ==================== MaterialApp ====================
class Lab8App extends StatelessWidget {
  const Lab8App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("ЛР №8 — Варіант 8"),
        ),
        body: Center(
          child: CustomLayoutWidget(
            a: 33,
            b: 43,
            c: 62,
            mainText: "I love programing",
            textColor: Colors.red,
          ),
        ),
      ),
    );
  }
}

/// ==================== ВЛАСНИЙ ВІДЖЕТ ====================
class CustomLayoutWidget extends StatelessWidget {
  final double a;
  final double b;
  final double c;
  final String mainText;
  final Color textColor;

  const CustomLayoutWidget({
    super.key,
    required this.a,
    required this.b,
    required this.c,
    required this.mainText,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Жовтий фон
        Container(
          width: 420,
          height: 260,
          color: Colors.yellow,
        ),

        // Зелений блок (a)
        Positioned(
          top: a,
          left: a,
          child: Container(
            width: 360,
            height: 200,
            color: Colors.green,
          ),
        ),

        // Синій блок (b)
        Positioned(
          top: a + b,
          left: a + b,
          child: Container(
            width: 300,
            height: 150,
            color: Colors.lightBlue,
          ),
        ),

        // Фіолетовий блок (c)
        Positioned(
          top: a + b + c,
          left: a + b + c,
          child: Container(
            width: 200,
            height: 90,
            color: Colors.purple.shade200,
          ),
        ),

        // Текст
        Positioned(
          top: a + b + c + 25,
          left: a + b + c + 25,
          child: Text(
            mainText,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
