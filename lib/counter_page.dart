import 'package:flutter/material.dart';
import 'package:state_management/state_management_sdk/state_listener.dart';
import 'package:state_management/state_management_sdk/state_provider.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final manager = StateProvider.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StateListener<int>(
                stateKey: 'counter1',
                builder: (context, count) {
                  return Column(
                    children: [
                      Text("Counter 1"),
                      Text(
                        '$count',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                manager.updateState('counter1', manager.getState<int>('counter1') + 1);
                              },
                              child: Icon(Icons.add),
                              backgroundColor: Colors.green.shade300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                manager.updateState('counter1', manager.getState<int>('counter1') - 1);
                              },
                              child: Icon(Icons.remove),
                              backgroundColor: Colors.red.shade100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 100),
              // Display counter2
              StateListener<int>(
                stateKey: 'counter2',
                builder: (context, count) {
                  return Column(
                    children: [
                      Text("Counter 2"),
                      Text(
                        '$count',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/another');
                },
                child: Text("Go to Second Page"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}