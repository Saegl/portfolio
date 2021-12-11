import 'models.dart';

class Repository {

  late Student _student;
  final studentList = <Student>[];

  Future<String?> loginStudent(Student student) async {
    _student = student;
    return null;
  }

  Future<String?> registerStudent(Student student) async {
    studentList.add(student);
    return null;
  }
}