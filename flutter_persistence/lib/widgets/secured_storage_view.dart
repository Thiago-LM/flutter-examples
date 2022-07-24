// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuredStorageView extends StatefulWidget {
  const SecuredStorageView({Key? key}) : super(key: key);

  @override
  State<SecuredStorageView> createState() => _SecuredStorageViewState();
}

class _SecuredStorageViewState extends State<SecuredStorageView> {
  final storage = const FlutterSecureStorage();
  final String KEY_API_TOKEN = 'api_token';
  String _data = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Secure storage of credential using\nflutter_secure_storage ^5.0.2',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 5)),
        const Text(
          'Stores data in Keychain (for iOS) and Keystore (for Android).',
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
                  'API TOKEN',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 5)),
                Text(
                  _data,
                  style: const TextStyle(
                    fontSize: 20,
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
                      onPressed: _generateApiToken,
                      child: const Text('Generate'),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      onPressed: _saveApiToken,
                      child: const Text('Save'),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      onPressed: _readApiToken,
                      child: const Text('Read'),
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

  _generateApiToken() {
    var desiredLength = 25;
    var rand = Random();
    var randomString = List.generate(desiredLength, (index) {
      return rand.nextInt(33) + 89;
    });

    setState(() {
      // Retrieve generated string
      _data = String.fromCharCodes(randomString);

      // Log
      debugPrint("Succesfully generated $_data");

      // Display data to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Generated string is $_data'),
          duration: const Duration(milliseconds: 1000),
        ),
      );
    });
  }

  _saveApiToken() async {
    await storage.write(key: KEY_API_TOKEN, value: _data);

    // Log
    debugPrint("Succesfully saved $_data");

    // Display data to the user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data successfully saved'),
        duration: Duration(milliseconds: 1000),
      ),
    );
  }

  _readApiToken() async {
    String? apiToken = await storage.read(key: KEY_API_TOKEN);

    setState(() {
      // Assign the retrieve data locally via synchronous call
      _data = apiToken!;

      // Log
      debugPrint("Succesfully retrieved $_data");

      // Display data to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data retrieved is $_data'),
          duration: const Duration(milliseconds: 1000),
        ),
      );
    });
  }
}
