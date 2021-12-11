import 'package:flutter/material.dart';
import 'package:portfolio/repository.dart';

class Provider extends InheritedWidget {
  final repository = Repository();

  Provider({
    Key? key,
    required child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static Repository of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<Provider>();
    return provider!.repository;
  }
}
