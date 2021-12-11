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

  void updateBlock(int id, Block b) {
    _student.updateBlock(id, b);
  }

  void addBlock(Block b) {
    _student.addBlock = b;
  }

  List<Block> getBlocks() {
    return _student.blocks;
  }
}
