import 'models.dart';

class Repository {
  late Student _student;
  final studentList = <Student>[];

  // hardcode
  GeneralInfo hardcodedGeneralInfo = GeneralInfo(
    name: 'Ahmet',
    surname: 'Dastan',
    gpa: 2.6,
  );
  //

  String? loginStudent(Student student) {
    // if(!studentList.contains(student)) {
    //   return 'such student do not exist';
    // }

    _student = student;
    _student.setGeneralInfo = hardcodedGeneralInfo;
    return null;
  }

  String? registerStudent(Student student) {
    if(studentList.contains(student)) {
      return 'student already registered';
    }

    studentList.add(student);
    return null;
  }

  GeneralInfo getGeneralInfo() {
    return _student.generalInfo!;
  }


}
