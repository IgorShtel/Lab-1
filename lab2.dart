void main() {
  List<Abiturient> abiturients = [];
  List<Student> students = [];

  abiturients.add(Entrant("Іван Петренко", 180));
  abiturients.add(Entrant("Марія Коваль", 195));

  students.add(StudentFaculty("Олег Сидоренко", "Комп’ютерні науки", 2));
  students.add(StudentFaculty("Анна Мельник", "Інформаційні системи", 1));

  print("Абітурієнти:");
  for (var a in abiturients) {
    print(a.info());
  }

  print("\nСтуденти:");
  for (var s in students) {
    print(s.info());
  }
}

/// ===== Інтерфейс =====
abstract class Abiturient {
  String getName();
  int getScore();
  String info();
}

/// ===== Абстрактний клас =====
abstract class Student implements Abiturient {
  String name;

  Student(this.name);

  @override
  String getName() => name;

  @override
  int getScore() => 0; // для студентів не актуально

  @override
  String info();
}

/// ===== Абітурієнт (реалізація інтерфейсу) =====
class Entrant implements Abiturient {
  String name;
  int score;

  Entrant(this.name, this.score);

  @override
  String getName() => name;

  @override
  int getScore() => score;

  @override
  String info() {
    return "Абітурієнт: $name, Бал: $score";
  }
}

/// ===== Дочірний клас студента =====
class StudentFaculty extends Student {
  String faculty;
  int course;

  StudentFaculty(String name, this.faculty, this.course) : super(name);

  @override
  String info() {
    return "Студент: $name, Факультет: $faculty, Курс: $course";
  }
}
