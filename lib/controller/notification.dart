// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Future<void> scheduleNotificationForEvent(Event event) async {
//   final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   // Initialize the plugin with settings
//   final initializationSettings = InitializationSettings(
//     android: AndroidInitializationSettings('@drawable/ic_notification'),
//     iOS: IOSInitializationSettings(),
//   );
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);

//   // Create a notification for the event
//   final androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     'event_reminder_channel',
//     'Event Reminders',
//     'Notifications for upcoming events',
//     importance: Importance.high,
//     priority: Priority.high,
//   );
//   final iOSPlatformChannelSpecifics = IOSNotificationDetails();
//   final platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//     iOS: iOSPlatformChannelSpecifics,
//   );

//   final notificationTitle = 'Upcoming Event: ${event.title}';
//   final notificationBody = 'Your event starts in 30 minutes!';
//   final notificationTime = event.startTime.subtract(Duration(minutes: 30));
//   await flutterLocalNotificationsPlugin.schedule(
//     event.id.hashCode,
//     notificationTitle,
//     notificationBody,
//     notificationTime,
//     platformChannelSpecifics,
//     payload: event.id.toString(),
//   );
// }
