import 'package:flutter/material.dart';

import 'state_manager.dart';

class StateProvider extends InheritedWidget {
  final StateManager manager;

  StateProvider({required this.manager, required Widget child}) : super(child: child);

  static StateManager of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<StateProvider>();
    return provider!.manager;
  }

  @override
  bool updateShouldNotify(StateProvider oldWidget) {
    return false;
  }
}