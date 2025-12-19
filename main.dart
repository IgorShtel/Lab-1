
import 'dart:math';

void main() {
  double xStart = 1.23 * 8;     // 9.84
  double y = 4.6 * 8;           // 36.8
  double z = 36.6 / 8;          // 4.575

  Function table = outer(xStart, y, z);

  for (int i = 0; i < 10; i++) {
    table();
  }
}

Function outer(double x, double y, double z) {

  Function b = (double x, double y, double z) {
    return pow((y + x).abs(), 0.2) / pow(z.abs(), 1.34)
        + pow(y - z, 2) / (1 + pow(sin(y), 2))
        + pow((z - y).abs(), 3) / (1 - cos(pow(x, 2)));
  };

  return () {
    double a = (pow((pow(x, 2) - 1).abs(), 0.3)
              - pow((y + 2 * b(x, y, z)).abs(), 1 / 3)) /
        (1 + x + pow(y, 2) / 2 + pow(z, 3) / 6);

    print("x=$x  y=$y  z=$z  a=$a");
    x += 1;
  };
}
