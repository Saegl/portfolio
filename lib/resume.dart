import 'package:flutter/material.dart';
import 'package:portfolio/models.dart';
import 'package:portfolio/provider.dart';

TextStyle name = TextStyle(fontSize: 26.0);
TextStyle h1 = TextStyle(fontSize: 20.0);
TextStyle h2 = TextStyle(fontSize: 16.0);
TextStyle p = TextStyle(fontSize: 14.0);

class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  List<Widget> sections = [];
  @override
  Widget build(BuildContext context) {
    final repository = Provider.of(context);
    GeneralInfo info = repository.getGeneralInfo();
    sections.add(Padding(
      padding: EdgeInsets.symmetric(horizontal: 120.0),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                'https://avatars.mds.yandex.net/get-zen_doc/49613/pub_5a6848d677d0e6434dc869d4_5a684dd8168a918051c0ea50/scale_1200',
                width: 200.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${info.name} ${info.surname}",
                    style: name,
                  ),
                  Text(info.faculty, style: h2),
                  Text("GPA ${info.gpa}/4.0", style: h2),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
    for (var block in repository.getBlocks()) {
      sections.add(Section(block.name, block.title, block.description));
    }

    return MaterialApp(
      title: 'Resume',
      home: Scaffold(
        body: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, int index) {
            return sections[index];
          },
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  Section(
      this.name, this.title,this.description, {
        Key? key,
      }) : super(key: key);
  final String name;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: h1,
              ),
              Text(title, style: h2),
              Text(
                 description,
                  style: p),
            ],
          ),
        ),
      ),
    );
  }
}