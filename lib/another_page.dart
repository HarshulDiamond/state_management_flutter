import 'package:flutter/material.dart';
import 'package:state_management/state_management_sdk/state_listener.dart';
import 'package:state_management/state_management_sdk/state_provider.dart';

class AnotherPage extends StatelessWidget {
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
                stateKey: 'counter2',
                builder: (context, count) {
                  return Column(
                    children: [
                      Text("Counter 2"),
                      Text(
                        '$count',
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: FloatingActionButton(
                              onPressed: () {
                                manager.updateState('counter2',
                                    manager.getState<int>('counter2') + 1);
                              },
                              child: Icon(Icons.add),
                              backgroundColor: Colors.green.shade300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: FloatingActionButton(
                              onPressed: () {
                                manager.updateState('counter2',
                                    manager.getState<int>('counter2') - 1);
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
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text("Go to First  Page"),
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
