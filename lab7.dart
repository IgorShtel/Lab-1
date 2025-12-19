import 'package:flutter/material.dart';

void main() {
  runApp(const Lab7Variant8App());
}

class Lab7Variant8App extends StatelessWidget {
  const Lab7Variant8App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Variant8Screen(),
    );
  }
}

class Variant8Screen extends StatelessWidget {
  const Variant8Screen({super.key});

  // Параметри варіанту 8
  static const double a = 33;
  static const double b = 43;
  static const double c = 62;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            // Жовтий фон
            Container(
              width: 420,
              height: 260,
              color: Colors.yellow,
            ),

            // Зелений шар (a)
            Positioned(
              top: a,
              left: a,
              child: Container(
                width: 360,
                height: 200,
                color: Colors.green,
              ),
            ),

            // Синій шар (b)
            Positioned(
              top: a + b,
              left: a + b,
              child: Container(
                width: 300,
                height: 150,
                color: Colors.lightBlue,
              ),
            ),

            // Фіолетовий шар (c)
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
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "I love ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "programing",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
