import 'package:flutter/material.dart';

TextStyle name = TextStyle(fontSize: 26.0);
TextStyle h1 = TextStyle(fontSize: 20.0);
TextStyle h2 = TextStyle(fontSize: 16.0);
TextStyle p = TextStyle(fontSize: 14.0);

class ResumeEditor extends StatefulWidget {
  const ResumeEditor({Key? key}) : super(key: key);

  @override
  _ResumeEditorState createState() => _ResumeEditorState();
}

class _ResumeEditorState extends State<ResumeEditor> {
  List<Widget> sections = [
    Padding(
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
                    "Name Surname",
                    style: name,
                  ),
                  Text("Computer Science", style: h2),
                  Text("GPA 4.0/4.0", style: h2),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(120.0, 10.0, 120.0, 0.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "COURSES",
                style: h1,
              ),
              Text("CSS 225 Web Programming Fundamentals", style: h2),
              Text("- HTML, CSS, Javascript basic sites", style: p),
              Text(
                  "- CRUD Blog; FRONT: bootstrap, Ajax; BACK: Flask, Sqlite, JSON storage",
                  style: p)
            ],
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "AWARDS",
                style: h1,
              ),
              Text("Hackaton 2021 Winner", style: h2),
              Text("Website for online resume generation", style: p),
            ],
          ),
        ),
      ),
    ),
    Section("Example"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Resume',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Edit Resume"),
        ),
        body: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, int index) {
            return sections[index];
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("new section");
            sections.add(Section("Example"));
            print(sections.length);
            setState(() {});
          },
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section(
      this.name, {
        Key? key,
      }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
      child: Card(
        child: InkWell(
          onTap: () {
            print('ok');
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: h1,
                ),
                Text("ChocoDev Internship", style: h2),
                Text(
                    "boring description about the passed interternship/jobs and other stuff",
                    style: p),
              ],
            ),
          ),
        ),
      ),
    );
  }
}