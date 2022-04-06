import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taskaia/view/notification_view/notification_view.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as timeZone;
import '../../model/task.dart';

class NotificationHelper {
  static late final FlutterLocalNotificationsPlugin
      flutterLocalNotificationsPlugin;
  static late final AndroidInitializationSettings initializationSettingsAndroid;
  static late final IOSInitializationSettings initializationSettingsIOS;
  static late final InitializationSettings initializationSettings;
  static final BehaviorSubject<String> selectNotificationSubject =
      BehaviorSubject<String>();

  static Future<void> initNotification() async {
    await configureLocalTimeZone();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    configureSelectNotificationSubject();
    initializationSettingsAndroid =
        const AndroidInitializationSettings('notification_icon');
    initializationSettingsIOS = const IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) {
      print(payload);
    });
  }

  static void iosRequestPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  // static Future<void> selectNotification(String? payload) async {
  //   selectNotificationSubject.stream.listen((String payload) async {
  //     print('My payload is ' + payload);
  //     await Get.to(() => const NotificationView());
  //   });
  // }

  static Future<void> displayNotification(
      {required String title, required String body}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            playSound: true);
    IOSNotificationDetails iosPlatformChannelSpecifics =
        const IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iosPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics,
        payload: 'Default_sound');
  }

  static Future<void> scheduleNotification(
      {required int hours, required int minutes, required Task task}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            playSound: true);
    IOSNotificationDetails iosPlatformChannelSpecifics =
        const IOSNotificationDetails();
    await flutterLocalNotificationsPlugin.zonedSchedule(
        task.id!,
        task.title,
        task.content,
        nextInstanceOfTenAM(hours, minutes),
        NotificationDetails(
            android: androidPlatformChannelSpecifics,
            iOS: iosPlatformChannelSpecifics),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  ///THIS METHOD IS MADE TO CALCULATE DATETIME
  static timeZone.TZDateTime nextInstanceOfTenAM(int hour, int minutes) {
    final timeZone.TZDateTime now = timeZone.TZDateTime.now(timeZone.local);
    timeZone.TZDateTime scheduledDate = timeZone.TZDateTime(
        timeZone.local, now.year, now.month, now.day, hour, minutes);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  static Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    timeZone.setLocalLocation(timeZone.getLocation(timeZoneName));
  }

  static void configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
      print('My payload is ' + payload);
      await Get.to(() => NotificationView());
    });
  }
}
