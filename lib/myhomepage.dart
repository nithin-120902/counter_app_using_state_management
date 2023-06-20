// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:counter_app_using_state_management/counter.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    String value = context.watch<Counter>().counter.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                onPressed: () {
                  if (value == '0') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Count can't go below zero."),
                        showCloseIcon: true,
                        duration: const Duration(milliseconds: 1500),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    );
                  } else {
                    Provider.of<Counter>(context, listen: false).decrement();
                  }
                },
                child: Icon(Icons.horizontal_rule),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                  onPressed: () {
                    Provider.of<Counter>(context, listen: false).reset();
                  },
                  child: Icon(Icons.replay_sharp))),
          Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Provider.of<Counter>(context, listen: false).increment();
                },
                child: Icon(Icons.add),
              )),
        ],
      ),
    );
  }
}
