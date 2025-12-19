import 'dart:async';

void main() {
  // Дані (з ЛР4/логіки колекцій) — тут беремо варіант 8: Станція метро + години
  final station = MetroStation("Арсенальна", 1960);

  station.addHour(MetroHour(8, 1200, "Ранковий пік, багато людей"));
  station.addHour(MetroHour(9, 1500, "Ще пік, але вже трохи менше"));
  station.addHour(MetroHour(14, 500, "Спокійно"));
  station.addHour(MetroHour(22, 500, "Пізній час, мало пасажирів, тихо і комфортно"));
  station.addHour(MetroHour(18, 2000, "Вечірній пік, черги на ескалатор"));

  // 1) Future.delayed(...) — імітація довгої операції (наприклад, запит/запис)
  Future<void> addHourAsync(MetroHour hour) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => station.addHour(hour),
    );
  }

  // 2) Future(() => ...) — швидке асинхронне обчислення (без затримки)
  Future<int> totalPassengersAsync() {
    return Future(() => station.totalPassengers());
  }

  // 3) Послідовний виклик з await + обробка помилок
  Future<void> doWork() async {
    print("Початок doWork");

    try {
      // Перевірка значень (щоб був приклад throw)
      final newHour = MetroHour(12, 900, "Денний потік");
      if (newHour.passengers < 0 || newHour.hour < 0 || newHour.hour > 23) {
        throw Exception("Некоректні дані для години");
      }

      await addHourAsync(newHour); // await 1
      print("Додано годину асинхронно.");
    } catch (e) {
      print("Помилка при додаванні години: $e");
    }

    try {
      final sum = await totalPassengersAsync(); // await 2
      if (sum <= 0) {
        throw Exception("Сумарна кількість пасажирів не може бути <= 0");
      }
      print("Сумарна кількість пасажирів: $sum");
    } catch (e) {
      print("Помилка при обчисленні суми: $e");
    }

    print("\nПоточні дані станції:");
    station.showData();

    final mins = station.hoursWithMinPassengers();
    print("\nГодини з мінімальною кількістю пасажирів (${mins.first.passengers}):");
    for (var h in mins) {
      print(h);
    }

    final maxWords = station.hourWithMaxCommentWords();
    print("\nГодина з найбільшою кількістю слів у коментарі (${maxWords.commentWordCount()} слів):");
    print(maxWords);

    print("Завершення doWork");
  }

  doWork();
}

/// ======== МОДЕЛІ (варіант 8) ========

class MetroStation {
  String name;
  int openYear;

  final Set<MetroHour> _hours = {};

  MetroStation(this.name, this.openYear);

  void addHour(MetroHour hour) => _hours.add(hour);

  void showData() {
    print("Станція метро: $name (рік відкриття: $openYear)");
    print("Година | Пасажири | Коментар");
    for (var h in _hours) {
      print("${h.hour.toString().padLeft(2, '0')}     | ${h.passengers}      | ${h.comment}");
    }
  }

  int totalPassengers() {
    int sum = 0;
    for (var h in _hours) {
      sum += h.passengers;
    }
    return sum;
  }

  Set<MetroHour> hoursWithMinPassengers() {
    if (_hours.isEmpty) return {};

    int min = _hours.first.passengers;
    for (var h in _hours) {
      if (h.passengers < min) min = h.passengers;
    }

    final Set<MetroHour> result = {};
    for (var h in _hours) {
      if (h.passengers == min) result.add(h);
    }
    return result;
  }

  MetroHour hourWithMaxCommentWords() {
    if (_hours.isEmpty) return MetroHour(0, 0, "");

    MetroHour best = _hours.first;
    int bestWords = best.commentWordCount();

    for (var h in _hours) {
      int w = h.commentWordCount();
      if (w > bestWords) {
        best = h;
        bestWords = w;
      }
    }
    return best;
  }
}

class MetroHour {
  int hour; // 0..23
  int passengers;
  String comment;

  MetroHour(this.hour, this.passengers, this.comment);

  int commentWordCount() {
    final t = comment.trim();
    if (t.isEmpty) return 0;
    return t.split(RegExp(r"\s+")).length;
  }

  @override
  String toString() => "Година: $hour, Пасажири: $passengers, Коментар: $comment";

  // Унікальність для Set: одна година = один запис
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is MetroHour && other.hour == hour);

  @override
  int get hashCode => hour.hashCode;
}
