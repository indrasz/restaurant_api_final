import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodyar_final/src/data/services/api_services.dart';
import 'package:foodyar_final/src/helper/notification_helper.dart';
import 'package:http/http.dart';

final ReceivePort port = ReceivePort();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializedIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    final NotificationHelper notificationHelper = NotificationHelper();
    // var result = await ApiService().getListRestaurant(http.Client());
    var result = await ApiService().getListRestaurant(Client());
    await notificationHelper.showNotification(
      flutterLocalNotificationsPlugin,
      result,
    );

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
