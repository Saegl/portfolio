import 'package:flutter/material.dart';
import 'package:portfolio/provider.dart';
import 'package:portfolio/resume.dart';

import 'models.dart';

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
  List<Widget> sections = [];

  @override
  Widget build(BuildContext context) {
    final blocks = Provider.of(context).getBlocks();
    final generalInfo = Provider.of(context).getGeneralInfo();
    sections.clear();

    sections.add(
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
    );


    for(var i = 0;i<blocks.length;i++) {
      sections.add(Section(i, blocks[i].name, blocks[i].title, blocks[i].description));
    }
    return MaterialApp(
      title: 'Edit Resume',
      home: Scaffold(
        appBar: AppBar(
          actions:[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Resume()));
              },
              child: Text('Open Resume'),
            ),
          ],
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
            Provider.of(context).addBlock(Block('tempdate','title', "description"));
            setState(() {});
          },
        ),
      ),
    );
  }
}

class Section extends StatefulWidget {
  Section(
      this.id,
    this.name,
      this.title,
      this.description, {
    Key? key,
  }) : super(key: key);
  final String name;
  final int id;
  final String title;
  final String description;

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  late TextEditingController nameController;
  late TextEditingController titleController;
  late TextEditingController descController;
  String name = '';
  String description = '';
  String title = '';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descController = TextEditingController();
    titleController = TextEditingController();
    name = widget.name;
    description = widget.description;
    title = widget.title;
  }

  void dispose() {
    nameController.dispose();
    descController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
      child: Card(
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('edit'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(hintText: 'block name'),
                    ),
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(hintText: 'title'),
                    ),
                    TextFormField(
                      controller: descController,
                      decoration: InputDecoration(hintText: 'description'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of(context).updateBlock(this.widget.id, Block(nameController.text, titleController.text, descController.text));
                        print(Provider.of(context).getBlocks().map((e) => e.name));
                        name = nameController.text;
                        description = descController.text;
                        title = titleController.text;
                        setState(() {});
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Text('submit'),
                    ),
                  ],
                ),
              ),
            ).then((value) => setState((){}));
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
                Text(title, style: h2),
                Text(
                    description,
                    style: p),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
