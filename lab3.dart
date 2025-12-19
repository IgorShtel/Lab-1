void main() {
  MetroStation station = MetroStation("Арсенальна", 1960);

  station.addHour(MetroHour(8, 1200, "Ранковий пік, багато людей"));
  station.addHour(MetroHour(9, 1500, "Ще пік, але вже трохи менше"));
  station.addHour(MetroHour(14, 500, "Спокійно"));
  station.addHour(MetroHour(22, 500, "Пізній час, мало пасажирів, тихо і комфортно"));
  station.addHour(MetroHour(18, 2000, "Вечірній пік, черги на ескалатор"));

  station.showData();

  print("\nСумарна кількість пасажирів: ${station.totalPassengers()}");

  Set<MetroHour> mins = station.hoursWithMinPassengers();
  print("Години з мінімальною кількістю пасажирів (${mins.first.passengers}):");
  for (var h in mins) {
    print(h);
  }

  MetroHour maxWords = station.hourWithMaxCommentWords();
  print("\nГодина з найбільшою кількістю слів у коментарі (${maxWords.commentWordCount()} слів):");
  print(maxWords);
}

/// ==================== Перший клас ====================
class MetroStation {
  String name;
  int openYear;

  final Set<MetroHour> _hours = {};

  MetroStation(this.name, this.openYear);

  void addHour(MetroHour hour) => _hours.add(hour);

  Set<MetroHour> getHours() => _hours;

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
    if (_hours.isEmpty) {
      return MetroHour(0, 0, "");
    }

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

/// ==================== Другий клас ====================
class MetroHour {
  int hour; // 0..23
  int passengers;
  String comment;

  MetroHour(this.hour, this.passengers, this.comment);

  int commentWordCount() {
    final text = comment.trim();
    if (text.isEmpty) return 0;
    return text.split(RegExp(r"\s+")).length;
  }

  @override
  String toString() => "Година: $hour, Пасажири: $passengers, Коментар: $comment";

  // Щоб Set вважав об'єкти "унікальними" по годині:
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is MetroHour && other.hour == hour);

  @override
  int get hashCode => hour.hashCode;
}
