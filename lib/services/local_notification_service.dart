import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static const _androidSettings = AndroidInitializationSettings('app_icon');
  static const details = AndroidNotificationDetails(
    'test',
    'test_channel',
    channelDescription: 'this is a test channel',
    importance: Importance.max,
    priority: Priority.max,
    ticker: 'ticker',
  );
  static int _counter = 0;

  static Future<void> initializeNotifications() async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: _androidSettings,
    );
    await _plugin.initialize(initializationSettings);
  }

  static Future<void> show({
    required String title,
    required String body,
  }) async {
    const notificationDetails = NotificationDetails(
      android: details,
    );
    await _plugin.show(
      _counter,
      title,
      body,
      notificationDetails,
    );
    _counter++;
  }
}
