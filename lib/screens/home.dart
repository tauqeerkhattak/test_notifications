import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const platform = MethodChannel('our_channel');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              platform.invokeMethod(
                'showNotification',
                {
                  'title': 'Hello World!',
                  'body': 'I am into android now!',
                },
              );
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
