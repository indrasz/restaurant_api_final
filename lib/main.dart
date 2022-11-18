import 'dart:io';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodyar_final/src/data/db/favorite_db.dart';
import 'package:foodyar_final/src/helper/notification_helper.dart';
import 'package:foodyar_final/src/helper/preference_helper.dart';
import 'package:foodyar_final/src/modules/pages/main_page.dart';
import 'package:foodyar_final/src/providers/favorite_provider.dart';
import 'package:foodyar_final/src/providers/preference_provider.dart';
import 'package:foodyar_final/src/providers/restaurant_provider.dart';
import 'package:foodyar_final/src/data/services/api_services.dart';
import 'package:foodyar_final/src/providers/schedule_provider.dart';
import 'package:foodyar_final/src/utils/background_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();

  service.initializedIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  runApp(const MyApp());
}

// void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantProvider>(
          create: (context) => RestaurantProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider<FavoriteProvider>(
          create: (_) => FavoriteProvider(favoriteDatabase: FavoriteDatabase()),
        ),
        ChangeNotifierProvider<PreferenceProvider>(
          create: (_) => PreferenceProvider(
            preferenceHelper: PreferenceHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider<ScheduleProvider>(
          create: (_) => ScheduleProvider(),
        ),
      ],
      child: Consumer<PreferenceProvider>(
        builder: (context, provider, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainPage(),
          );
        }
      ),
    );
  }
}
