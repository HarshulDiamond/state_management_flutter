import 'package:flutter/material.dart';
import 'package:state_management/state_management_sdk/state_manager.dart';
import 'package:state_management/state_management_sdk/state_provider.dart';

class StateListener<T> extends StatefulWidget {
  final String stateKey;
  final Widget Function(BuildContext context, T state) builder;

  const StateListener({required this.stateKey, required this.builder});

  @override
  _StateListenerState<T> createState() => _StateListenerState<T>();
}

class _StateListenerState<T> extends State<StateListener<T>> {
  late StateManager manager;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    manager = StateProvider.of(context);
    manager.addListener(widget.stateKey, _onStateChange);
  }

  @override
  void dispose() {
    manager.removeListener(widget.stateKey, _onStateChange);
    super.dispose();
  }

  void _onStateChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    T state = manager.getState<T>(widget.stateKey);
    return widget.builder(context, state);
  }
}