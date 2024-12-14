import 'package:flutter/material.dart';
import 'package:state_management/state_management_sdk/state_manager.dart';
import 'package:state_management/state_management_sdk/state_provider.dart';

import 'another_page.dart';
import 'counter_page.dart';
void main() {
  final stateManager = StateManager();
  stateManager.addState<int>('counter2', 0);
  stateManager.addState<int>('counter1', 0);
  runApp(
    StateProvider(
      manager: stateManager,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterPage(),
        routes: {
          '/home': (context) => CounterPage(),
          '/another': (context) => AnotherPage(),
        },
      ),
    ),
  );
}
