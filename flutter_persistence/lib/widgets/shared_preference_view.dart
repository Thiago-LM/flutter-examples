// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceView extends StatefulWidget {
  const SharedPreferenceView({Key? key}) : super(key: key);

  @override
  State<SharedPreferenceView> createState() => _SharedPreferenceViewState();
}

class _SharedPreferenceViewState extends State<SharedPreferenceView> {
  final String KEY_COUNTER = 'counter';
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    // Update view with the initial value
    _retrievePersistedCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Storing simple data locally using\nshared_preferences ^2.0.15',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 5)),
        const Text(
          'Wraps NSUserDefaults (on iOS and macOS) and SharedPreferences (on Android). Not recommended for storing critical data.',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.blue,
            height: 150,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'COUNTER',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 5)),
                Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _incrementCounter,
                      child: const Text('Increment'),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      onPressed: _decreaseCounter,
                      child: const Text('Decrement'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _retrievePersistedCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int counter = (preferences.getInt(KEY_COUNTER) ?? 0) + 1;

    setState(() {
      _counter = counter;
    });
  }

  _incrementCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int counter = (preferences.getInt(KEY_COUNTER) ?? 0) + 1;
    await preferences.setInt(KEY_COUNTER, counter);

    setState(() {
      _counter = counter;
    });
  }

  _decreaseCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int counter = (preferences.getInt(KEY_COUNTER) ?? 0) - 1;
    await preferences.setInt(KEY_COUNTER, counter);

    setState(() {
      _counter = counter;
    });
  }
}
