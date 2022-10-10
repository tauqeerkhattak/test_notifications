import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
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

bool firstTime = true;
Future<void> onStart(ServiceInstance instance) async {
  if (firstTime) {
    firstTime = false;
    WidgetsFlutterBinding.ensureInitialized();
    await NotificationService.initializeNotifications();
    await Firebase.initializeApp();
    log('FIRST TIME: $firstTime');
  }
  FirebaseFirestore.instance
      .collection('users')
      .doc('abc')
      .snapshots()
      .listen((event) async {
    log('SHOW NOTIFICATION: ${event.id}');
    await NotificationService.show(
      title: 'Hello World!',
      body: 'The name is: ${event.get('name')}',
    );
  });
}
