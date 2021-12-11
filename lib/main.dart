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
