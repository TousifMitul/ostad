// A. Define the Role interface
abstract class Role {
  void displayRole();
}

// B. Create the Person class implementing Role
class Person implements Role {
  final String name;
  final int age;
  final String address;
  late Role role;

  Person(this.name, this.age, this.address, this.role);

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;

  @override
  void displayRole() {
    role.displayRole();
  }
}

// C. Student class extending Person
class Student extends Person {
  final String studentID;
  final String grade;
  final List<double> courseScores;

  Student({
    required String name,
    required int age,
    required String address,
    required this.studentID,
    required this.grade,
    required this.courseScores,
  }) : super(name, age, address, _StudentRole());

  // Calculate average score
  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    double sum = courseScores.reduce((a, b) => a + b);
    return sum / courseScores.length;
  }

  @override
  void displayRole() {
    role.displayRole();
  }
}

// Student Role implementation
class _StudentRole implements Role {
  @override
  void displayRole() {
    print("Role: Student");
  }
}

// D. Teacher class extending Person
class Teacher extends Person {
  final String teacherID;
  final List<String> coursesTaught;

  Teacher({
    required String name,
    required int age,
    required String address,
    required this.teacherID,
    required this.coursesTaught,
  }) : super(name, age, address, _TeacherRole());

  void displayCourses() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }

  @override
  void displayRole() {
    role.displayRole();
  }
}

// Teacher Role implementation
class _TeacherRole implements Role {
  @override
  void displayRole() {
    print("Role: Teacher");
  }
}

// E. StudentManagementSystem class with main method
void main() {
  // Create a student
  Student student = Student(
    name: "John Doe",
    age: 20,
    address: "123 Main St",
    studentID: "S123",
    grade: "A",
    courseScores: [90, 85, 82],
  );

  print("Student Information:\n");
  student.displayRole();
  print("Name: ${student.getName()}");
  print("Age: ${student.getAge()}");
  print("Address: ${student.getAddress()}");
  print("Average Score: ${student.calculateAverageScore()}\n");

  // Create a teacher
  Teacher teacher = Teacher(
    name: "Mrs. Smith",
    age: 35,
    address: "456 Oak St",
    teacherID: "T456",
    coursesTaught: ["Math", "English", "Bengali"],
  );

  print("Teacher Information:\n");
  teacher.displayRole();
  print("Name: ${teacher.getName()}");
  print("Age: ${teacher.getAge()}");
  print("Address: ${teacher.getAddress()}");
  teacher.displayCourses();
}
