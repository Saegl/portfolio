class Student {
  String studId;
  String password;
  GeneralInfo? generalInfo;
  List<Block> blocks = [];

  Student(this.studId, this.password, {this.generalInfo});

  set setGeneralInfo(GeneralInfo genInf) {
    generalInfo = genInf;
  }

  set addBlock(Block s) {
    blocks.add(s);
  }

  void updateBlock(int id, Block b) {
    blocks[id] = b;
  }
}

class GeneralInfo {
  String name;
  String surname;
  double gpa;
  String faculty;
  String imgURL;

  GeneralInfo({
    this.name = 'name',
    this.surname = 'surname',
    this.gpa = 3.0,
    this.faculty = 'engineering',
    this.imgURL = 'https://avatars.mds.yandex.net/get-zen_doc/49613/pub_5a6848d677d0e6434dc869d4_5a684dd8168a918051c0ea50/scale_1200',
  });
}

class Block {
  String name;
  String title;
  String description;
  Block(this.name, this.title, this.description);
}