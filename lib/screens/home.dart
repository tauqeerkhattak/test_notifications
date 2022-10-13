import 'package:flutter/material.dart';
import 'package:test_push_notification/services/background_service.dart';

import '../main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await BackgroundService.configure(
                onStart: onStart,
              );
              await BackgroundService.start();
            },
            child: const Text(
              'DISPLAY NOTY',
            ),
          ),
        ],
      ),
    );
  }
}
