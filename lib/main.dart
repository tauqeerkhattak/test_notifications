import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_push_notification/screens/home.dart';
import 'package:test_push_notification/services/local_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService.initializeNotifications();
  runApp(const TestNotifications());
}

class TestNotifications extends StatelessWidget {
  const TestNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
