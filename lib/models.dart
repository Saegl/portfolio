class Student {
  String studId;
  String password;
  GeneralInfo? generalInfo;
  List<Section> sections = [];

  Student(this.studId, this.password, {this.generalInfo});

  set setGeneralInfo(GeneralInfo genInf) {
    generalInfo = genInf;
  }

  set addSection(Section s) {
    sections.add(s);
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

class Section {
  String name;
  List<Block> blocks = [];
  Section(this.name);

  set addBlock(Block b) {
    blocks.add(b);
  }
}

class Block {
  String name;
  String description;
  Block(this.name, this.description);
}