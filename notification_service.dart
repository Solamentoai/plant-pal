import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    await _flutterLocalNotificationsPlugin.initialize(InitializationSettings(android: androidSettings, iOS: iosSettings));
  }

  Future<void> scheduleWaterReminder(int plantId, String plantName, DateTime wateringTime) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      plantId,
      'Water your $plantName!',
      'Don\'t forget to water your plant.',
      wateringTime,
      const NotificationDetails(
        android: AndroidNotificationDetails('plant_channel', 'Plant Reminders', importance: Importance.max),
        iOS: DarwinNotificationDetails(),
      ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
      androidAllowWhileIdle: true,
    );
  }
}
