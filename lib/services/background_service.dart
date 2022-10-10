import 'package:flutter_background_service/flutter_background_service.dart';

class BackgroundService {
  static final _service = FlutterBackgroundService();

  static Future<void> configure(
      {required Function(ServiceInstance instance) onStart}) async {
    await _service.configure(
      iosConfiguration: IosConfiguration(
        // auto start service
        autoStart: true,

        // this will executed when app is in foreground in separated isolate
        onForeground: onStart,

        // you have to enable background fetch capability on xcode project
        // onBackground: onIosBackground,
      ),
      androidConfiguration: AndroidConfiguration(
        // this will executed when app is in foreground or background in separated isolate
        onStart: onStart,

        // auto start service
        autoStart: false,
        isForegroundMode: false,
      ),
    );
  }

  static Future<void> start() async {
    await _service.startService();
  }
}
