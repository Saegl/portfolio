import 'package:flutter/material.dart';
import 'package:portfolio/provider.dart';

import 'auth.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'SDU portfolio',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Auth(),
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
