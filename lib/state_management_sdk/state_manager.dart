import 'package:flutter/material.dart';

class StateManager {
  final Map<String, dynamic> _states = {};
  final Map<String, List<VoidCallback>> _listeners = {};

  void addState<T>(String key, T initialState) {
    if (!_states.containsKey(key)) {
      _states[key] = initialState;
      _listeners[key] = [];
    }
  }

  T getState<T>(String key) {
    return _states[key] as T;
  }

  void updateState<T>(String key, T newState) {
    if (_states.containsKey(key)) {
      _states[key] = newState;
      notifyListeners(key);
    }
  }

  void addListener(String key, VoidCallback listener) {
    _listeners[key]?.add(listener);
  }

  void removeListener(String key, VoidCallback listener) {
    _listeners[key]?.remove(listener);
  }

  void notifyListeners(String key) {
    for (var listener in _listeners[key]!) {
      listener();
    }
  }
}