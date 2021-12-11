import 'package:flutter/material.dart';

class ResumeEditor extends StatefulWidget {
  const ResumeEditor({Key? key}) : super(key: key);

  @override
  _ResumeEditorState createState() => _ResumeEditorState();
}

class _ResumeEditorState extends State<ResumeEditor> {
  List<Widget> children = [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 120.0),
      child: Card(
        child: Row(
          children: [
            Image.network('https://picsum.photos/250?image=9'),
            Column(
              children: [
                Text("Name Surname"),
                Text("Computer Science"),
                Text("GPA 4.0/4.0"),
              ],
            ),
          ],
        ),
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Resume',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Edit Resume"),
        ),
        body: ListView(
          children: children,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("new section");
          },
        ),
      ),
    );
  }
}