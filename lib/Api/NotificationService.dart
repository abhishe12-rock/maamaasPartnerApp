// // // import 'package:firebase_messaging/firebase_messaging.dart';
// // // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // // import 'package:flutter/material.dart';
// // //
// // // class NotificationService {
// // //
// // //   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
// // //
// // //   static final FlutterLocalNotificationsPlugin _localNotifications =
// // //   FlutterLocalNotificationsPlugin();
// // //
// // //   static Future<void> initialize() async {
// // //
// // //     // Request permission
// // //     NotificationSettings settings = await _messaging.requestPermission(
// // //       alert: true,
// // //       badge: true,
// // //       sound: true,
// // //     );
// // //
// // //     debugPrint("Permission: ${settings.authorizationStatus}");
// // //
// // //     // Get token
// // //     String? token = await _messaging.getToken();
// // //     debugPrint("FCM TOKEN: $token");
// // //
// // //     // Initialize local notifications
// // //     const AndroidInitializationSettings androidInit =
// // //     AndroidInitializationSettings('@mipmap/ic_launcher');
// // //
// // //     const InitializationSettings settingsInit =
// // //     InitializationSettings(android: androidInit);
// // //
// // //     await _localNotifications.initialize(settingsInit);
// // //
// // //     // Foreground message
// // //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// // //       debugPrint("Foreground Notification");
// // //       _showNotification(message);
// // //     });
// // //
// // //     // Notification click
// // //     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
// // //       debugPrint("Notification Clicked");
// // //     });
// // //   }
// // //
// // //   static Future<void> _showNotification(RemoteMessage message) async {
// // //
// // //     const AndroidNotificationDetails androidDetails =
// // //     AndroidNotificationDetails(
// // //       'channel_id',
// // //       'channel_name',
// // //       importance: Importance.max,
// // //       priority: Priority.high,
// // //       playSound: true,
// // //     );
// // //
// // //     const NotificationDetails details =
// // //     NotificationDetails(android: androidDetails);
// // //
// // //     await _localNotifications.show(
// // //       0,
// // //       message.notification?.title ?? "Notification",
// // //       message.notification?.body ?? "",
// // //       details,
// // //       payload: "notification",
// // //     );
// // //   }
// // // }
// // //
// // //  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// // //   print("🔔 Background message received");
// // //   print("Title: ${message.notification?.title}");
// // //   print("Body: ${message.notification?.body}");
// // // }
// // //
// // // import 'package:firebase_messaging/firebase_messaging.dart';
// // // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // //
// // // class NotificationService {
// // //   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
// // //
// // //   static final FlutterLocalNotificationsPlugin _localNotifications =
// // //       FlutterLocalNotificationsPlugin();
// // //
// // //   static Future<void> initialize() async {
// // //     NotificationSettings settings = await _messaging.requestPermission(
// // //       alert: true,
// // //       badge: true,
// // //       sound: true,
// // //     );
// // //
// // //     // debugPrint("Permission: ${settings.authorizationStatus}");
// // //
// // //     String? token = await _messaging.getToken();
// // //     // debugPrint("🔥 FCM TOKEN: $token");
// // //     final prefs = await SharedPreferences.getInstance();
// // //
// // //     await prefs.setString('fcmToken', token ?? "");
// // //     // 🔔 CREATE CHANNEL
// // //     const AndroidNotificationChannel channel = AndroidNotificationChannel(
// // //       'high_importance_channel',
// // //       'High Importance Notifications',
// // //       description: 'This channel is used for important notifications.',
// // //       importance: Importance.max,
// // //       playSound: true,
// // //       enableVibration: true,
// // //     );
// // //
// // //     await _localNotifications
// // //         .resolvePlatformSpecificImplementation<
// // //           AndroidFlutterLocalNotificationsPlugin
// // //         >()
// // //         ?.createNotificationChannel(channel);
// // //
// // //     const AndroidInitializationSettings androidSettings =
// // //         AndroidInitializationSettings('@mipmap/ic_launcher');
// // //
// // //     const InitializationSettings initSettings = InitializationSettings(
// // //       android: androidSettings,
// // //     );
// // //
// // //     await _localNotifications.initialize(initSettings);
// // //
// // //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// // //       // debugPrint("📩 Foreground Notification Received");
// // //
// // //       // debugPrint("Title: ${message.notification?.title}");
// // //       // debugPrint("Body: ${message.notification?.body}");
// // //
// // //       _showNotification(message);
// // //     });
// // //
// // //     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
// // //       // debugPrint("📲 Notification clicked");
// // //     });
// // //   }
// // //
// // //   static Future<void> _showNotification(RemoteMessage message) async {
// // //     const AndroidNotificationDetails androidDetails =
// // //         AndroidNotificationDetails(
// // //           'high_importance_channel',
// // //           'High Importance Notifications',
// // //           importance: Importance.max,
// // //           priority: Priority.high,
// // //           playSound: true,
// // //           enableVibration: true,
// // //         );
// // //
// // //     const NotificationDetails details = NotificationDetails(
// // //       android: androidDetails,
// // //     );
// // //
// // //     await _localNotifications.show(
// // //       0,
// // //       message.notification?.title ?? "Notification",
// // //       message.notification?.body ?? "",
// // //       details,
// // //     );
// // //   }
// // // }
// // //
// // // Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// // //   print("🔔 Background message received");
// // //   print("Title: ${message.notification?.title}");
// // //   print("Body: ${message.notification?.body}");
// // // }
// //
// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // class NotificationService {
// //   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
// //
// //   static final FlutterLocalNotificationsPlugin _localNotifications =
// //       FlutterLocalNotificationsPlugin();
// //
// //   static Future<void> initialize() async {
// //     NotificationSettings settings = await _messaging.requestPermission(
// //       alert: true,
// //       badge: true,
// //       sound: true,
// //     );
// //
// //     // debugPrint("Permission: ${settings.authorizationStatus}");
// //
// //     String? token = await _messaging.getToken();
// //     // debugPrint("🔥 FCM TOKEN: $token");
// //     final prefs = await SharedPreferences.getInstance();
// //
// //     await prefs.setString('fcmToken', token ?? "");
// //     // 🔔 CREATE CHANNEL
// //     const AndroidNotificationChannel channel = AndroidNotificationChannel(
// //       'high_importance_channel',
// //       'High Importance Notifications',
// //       description: 'This channel is used for important notifications.',
// //       importance: Importance.max,
// //       playSound: true,
// //       enableVibration: true,
// //     );
// //
// //     await _localNotifications
// //         .resolvePlatformSpecificImplementation<
// //           AndroidFlutterLocalNotificationsPlugin
// //         >()
// //         ?.createNotificationChannel(channel);
// //
// //     const AndroidInitializationSettings androidSettings =
// //         AndroidInitializationSettings('@mipmap/ic_launcher');
// //
// //     const InitializationSettings initSettings = InitializationSettings(
// //       android: androidSettings,
// //     );
// //
// //     await _localNotifications.initialize(initSettings);
// //
// //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// //       // debugPrint("📩 Foreground Notification Received");
// //
// //       // debugPrint("Title: ${message.notification?.title}");
// //       // debugPrint("Body: ${message.notification?.body}");
// //
// //       _showNotification(message);
// //     });
// //
// //     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
// //       // debugPrint("📲 Notification clicked");
// //     });
// //   }
// //
// //   static Future<void> _showNotification(RemoteMessage message) async {
// //     const AndroidNotificationDetails androidDetails =
// //         AndroidNotificationDetails(
// //           'high_importance_channel',
// //           'High Importance Notifications',
// //           importance: Importance.max,
// //           priority: Priority.high,
// //           playSound: true,
// //           enableVibration: true,
// //         );
// //
// //     const NotificationDetails details = NotificationDetails(
// //       android: androidDetails,
// //     );
// //
// //     await _localNotifications.show(
// //       0,
// //       message.notification?.title ?? "Notification",
// //       message.notification?.body ?? "",
// //       details,
// //       payload: "home",
// //     );
// //   }
// // }
// //
// // Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// //   print("🔔 Background message received");
// //   print("Title: ${message.notification?.title}");
// //   print("Body: ${message.notification?.body}");
// // }
//
//
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:audioplayers/audioplayers.dart';
//
// class NotificationService {
//   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//
//   static final FlutterLocalNotificationsPlugin _localNotifications =
//   FlutterLocalNotificationsPlugin();
//
//   // ── Shared AudioPlayer for new-order ringtone ──────────────────────────────
//   static final AudioPlayer _audioPlayer = AudioPlayer();
//   static bool _isRinging = false;
//
//   // ── Channel IDs ────────────────────────────────────────────────────────────
//   static const String _orderChannelId = 'new_order_channel';
//   static const String _orderChannelName = 'New Order Notifications';
//   static const String _highChannelId = 'high_importance_channel';
//   static const String _highChannelName = 'High Importance Notifications';
//
//   // ─────────────────────────────────────────────────────────────────────────
//   //  INITIALIZE  (call once in main.dart / app startup)
//   // ─────────────────────────────────────────────────────────────────────────
//   static Future<void> initialize() async {
//     // 1. Request permission
//     NotificationSettings settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     debugPrint("FCM Permission: ${settings.authorizationStatus}");
//
//     // 2. Get & store FCM token
//     String? token = await _messaging.getToken();
//     debugPrint("🔥 FCM TOKEN: $token");
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('fcmToken', token ?? '');
//
//     // 3. Setup audio player in looping mode
//     await _audioPlayer.setReleaseMode(ReleaseMode.loop);
//
//     // 4. Create notification channels
//     final androidPlugin = _localNotifications
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin
//     >();
//
//     // Channel for new orders (uses custom sound file)
//     await androidPlugin?.createNotificationChannel(
//       const AndroidNotificationChannel(
//         _orderChannelId,
//         _orderChannelName,
//         description: 'Plays ringtone when a new order arrives.',
//         importance: Importance.max,
//         playSound: true,
//         // Sound file must be in android/app/src/main/res/raw/
//         // e.g. android/app/src/main/res/raw/school_bell.mp3
//         sound: RawResourceAndroidNotificationSound('school_bell'),
//         enableVibration: true,
//       ),
//     );
//
//     // General high-importance channel
//     await androidPlugin?.createNotificationChannel(
//       const AndroidNotificationChannel(
//         _highChannelId,
//         _highChannelName,
//         description: 'Used for general important notifications.',
//         importance: Importance.max,
//         playSound: true,
//         enableVibration: true,
//       ),
//     );
//
//     // 5. Init local notifications plugin
//     const AndroidInitializationSettings androidSettings =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//     const InitializationSettings initSettings = InitializationSettings(
//       android: androidSettings,
//     );
//     await _localNotifications.initialize(initSettings);
//
//     // 6. Handle FCM foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       debugPrint("📩 Foreground Notification: ${message.notification?.title}");
//       _showHighImportanceNotification(message);
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       debugPrint("📲 Notification tapped");
//     });
//   }
//
//   // ─────────────────────────────────────────────────────────────────────────
//   //  PUBLIC: Called by HomeWrapper when a NEW ORDER is detected via polling
//   // ─────────────────────────────────────────────────────────────────────────
//
//   /// Shows a local notification AND starts the ringtone for a new order.
//   /// [orderId]   – the order / cart ID (for display)
//   /// [orderType] – e.g. "DINE_IN", "DELIVERY", "CATERING"
//   /// [isSoundEnabled] – pass HomeWrapper's _isSoundEnabled flag
//   static Future<void> showNewOrderNotification({
//     required dynamic orderId,
//     required String orderType,
//     bool isSoundEnabled = true,
//   }) async {
//     final label = _typeLabel(orderType);
//     final title = '🔔 New $label Order!';
//     final body = 'Order #$orderId is waiting for your confirmation.';
//
//     // Show local notification (uses channel sound = school_bell.mp3)
//     const AndroidNotificationDetails androidDetails =
//     AndroidNotificationDetails(
//       _orderChannelId,
//       _orderChannelName,
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//       sound: RawResourceAndroidNotificationSound('school_bell'),
//       enableVibration: true,
//       ticker: 'New Order',
//     );
//     const NotificationDetails details = NotificationDetails(
//       android: androidDetails,
//     );
//     await _localNotifications.show(
//       // Use orderId as notification ID so each order gets its own notification
//       orderId.hashCode,
//       title,
//       body,
//       details,
//       payload: 'order:$orderId',
//     );
//
//     // Start in-app ringtone via AudioPlayer (looping)
//     if (isSoundEnabled) {
//       await startRingtone();
//     }
//   }
//
//   /// Starts the looping ringtone (school-bell asset).
//   /// Safe to call multiple times – won't double-play.
//   static Future<void> startRingtone() async {
//     if (_isRinging) return;
//     try {
//       _isRinging = true;
//       await _audioPlayer.play(AssetSource('school-bell-310293.mp3'));
//     } catch (e) {
//       debugPrint('NotificationService: could not play ringtone: $e');
//       _isRinging = false;
//     }
//   }
//
//   /// Stops the looping ringtone.
//   static Future<void> stopRingtone() async {
//     if (!_isRinging) return;
//     try {
//       await _audioPlayer.stop();
//     } catch (_) {}
//     _isRinging = false;
//   }
//
//   /// Call this when the vendor has no more pending orders.
//   static bool get isRinging => _isRinging;
//
//   // ─────────────────────────────────────────────────────────────────────────
//   //  PRIVATE HELPERS
//   // ─────────────────────────────────────────────────────────────────────────
//
//   /// Used for foreground FCM push notifications (non-order alerts).
//   static Future<void> _showHighImportanceNotification(
//       RemoteMessage message,
//       ) async {
//     const AndroidNotificationDetails androidDetails =
//     AndroidNotificationDetails(
//       _highChannelId,
//       _highChannelName,
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//       enableVibration: true,
//     );
//     const NotificationDetails details = NotificationDetails(
//       android: androidDetails,
//     );
//     await _localNotifications.show(
//       0,
//       message.notification?.title ?? 'Notification',
//       message.notification?.body ?? '',
//       details,
//       payload: 'general',
//     );
//   }
//
//   static String _typeLabel(String? t) {
//     switch ((t ?? '').toUpperCase()) {
//       case 'DINE_IN':
//         return 'Dine In';
//       case 'TABLE_DINE_IN':
//         return 'Table Dine In';
//       case 'TAKEAWAY':
//         return 'Takeaway';
//       case 'DELIVERY':
//         return 'Delivery';
//       case 'CATERING':
//         return 'Catering';
//       default:
//         return t?.replaceAll('_', ' ') ?? 'Order';
//     }
//   }
// }
//
// // ─────────────────────────────────────────────────────────────────────────────
// //  Background handler (register in main.dart)
// // ─────────────────────────────────────────────────────────────────────────────
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   debugPrint("🔔 Background FCM: ${message.notification?.title}");
// }
// In NotificationService.dart
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:audioplayers/audioplayers.dart';
//
// class NotificationService {
//   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//
//   static final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();
//
//   static final AudioPlayer _audioPlayer = AudioPlayer();
//   static bool _isSoundEnabled = true;
//   static bool _isPlaying = false;
//
//   static Future<void> initialize() async {
//     NotificationSettings settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     String? token = await _messaging.getToken();
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('fcmToken', token ?? "");
//
//     // 🔔 CREATE CHANNEL with sound
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       description: 'This channel is used for important notifications.',
//       importance: Importance.max,
//       playSound: true,
//       enableVibration: true,
//       sound: RawResourceAndroidNotificationSound('school_bell'),
//     );
//
//     await _localNotifications
//         .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin
//         >()
//         ?.createNotificationChannel(channel);
//
//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const InitializationSettings initSettings = InitializationSettings(
//       android: androidSettings,
//     );
//
//     await _localNotifications.initialize(initSettings);
//
//     // Initialize audio player
//     await _audioPlayer.setReleaseMode(ReleaseMode.loop);
//
//     // Listen for foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       _showNotification(message);
//       _playOrderSound(); // Play sound when notification arrives
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // Handle notification click
//       _stopSound();
//     });
//   }
//
//   static Future<void> _playOrderSound() async {
//     if (!_isSoundEnabled || _isPlaying) return;
//     try {
//       _isPlaying = true;
//       await _audioPlayer.play(
//         AssetSource('school-bell-310293.mp3'),
//       ); // Your sound file
//     } catch (e) {
//       debugPrint('Sound play error: $e');
//       _isPlaying = false;
//     }
//   }
//
//   static Future<void> _stopSound() async {
//     if (_isPlaying) {
//       await _audioPlayer.stop();
//       _isPlaying = false;
//     }
//   }
//
//   static Future<void> _showNotification(RemoteMessage message) async {
//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//           'high_importance_channel',
//           'High Importance Notifications',
//           importance: Importance.max,
//           priority: Priority.high,
//           playSound: true,
//           enableVibration: true,
//         );
//
//     const NotificationDetails details = NotificationDetails(
//       android: androidDetails,
//     );
//
//     await _localNotifications.show(
//       0,
//       message.notification?.title ?? "New Order!",
//       message.notification?.body ?? "You have a new order",
//       details,
//       payload: "order",
//     );
//   }
//
//   // Add these methods to NotificationService
//
//   static Future<void> showLocalNotification({
//     required String title,
//     required String body,
//     String? payload,
//   }) async {
//     const AndroidNotificationDetails androidDetails =
//     AndroidNotificationDetails(
//       'high_importance_channel',
//       'High Importance Notifications',
//       importance: Importance.max,
//       priority: Priority.max,
//       playSound: true,
//       sound: RawResourceAndroidNotificationSound('school_bell_310293.mp3'),
//       enableVibration: true,
//     );
//
//     const NotificationDetails details = NotificationDetails(
//       android: androidDetails,
//     );
//
//     await _localNotifications.show(
//       DateTime.now().millisecond,
//       title,
//       body,
//       details,
//       payload: payload ?? "order",
//     );
//   }
//
//   static Future<void> showBackgroundNotification(RemoteMessage message) async {
//     await _showNotification(message);
//   }
//
//   static Future<void> triggerOrderSound() async {
//     await _playOrderSound();
//   }
//
//   // Method to stop sound
//   static Future<void> stopOrderSound() async {
//     await _stopSound();
//   }
//
//   // Toggle sound on/off
//   static void toggleSound(bool enabled) {
//     _isSoundEnabled = enabled;
//     if (!enabled) {
//       _stopSound();
//     }
//   }
//
//   static void dispose() {
//     _audioPlayer.dispose();
//   }
// }
//
// // Background handler
// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   debugPrint('🔔 Background message received');
//   debugPrint('Title: ${message.notification?.title}');
//   debugPrint('Body: ${message.notification?.body}');
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static final AudioPlayer _audioPlayer = AudioPlayer();

  static bool _isPlaying = false;
  static bool _isSoundEnabled = true;

  static const String channelId = 'school_bell_channel';
  static const String channelName = 'School Bell Notifications';

  static Future<void> initialize() async {
    await _messaging.requestPermission(alert: true, badge: true, sound: true);

    final token = await _messaging.getToken();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcmToken', token ?? '');

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      channelId,
      channelName,
      description: 'New order notifications',
      importance: Importance.max,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('school_bell'),
      enableVibration: true,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await _localNotifications.initialize(initSettings);

    await _audioPlayer.setReleaseMode(ReleaseMode.loop);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await _showNotification(message);
      await _playOrderSound();
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      await _stopSound();
    });
  }

  static Future<void> _playOrderSound() async {
    if (!_isSoundEnabled || _isPlaying) return;

    try {
      _isPlaying = true;

      await _audioPlayer.play(AssetSource('school-bell-310293.mp3'));
    } catch (e) {
      debugPrint('Sound error: $e');
      _isPlaying = false;
    }
  }

  static Future<void> _stopSound() async {
    if (!_isPlaying) return;

    await _audioPlayer.stop();
    _isPlaying = false;
  }

  static Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          channelId,
          channelName,
          importance: Importance.max,
          priority: Priority.max,
          playSound: true,
          sound: RawResourceAndroidNotificationSound('school_bell'),
          enableVibration: true,
        );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
    );

    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      message.notification?.title ?? 'New Order',
      message.notification?.body ?? 'You have a new order',
      details,
      payload: 'order',
    );
  }

  static Future<void> showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          channelId,
          channelName,
          importance: Importance.max,
          priority: Priority.max,
          playSound: true,
          sound: RawResourceAndroidNotificationSound('school_bell'),
          enableVibration: true,
        );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
    );

    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      details,
      payload: payload ?? 'order',
    );
  }

  static Future<void> triggerOrderSound() async {
    await _playOrderSound();
  }

  static Future<void> stopOrderSound() async {
    await _stopSound();
  }

  static void toggleSound(bool enabled) {
    _isSoundEnabled = enabled;

    if (!enabled) {
      _stopSound();
    }
  }

  static void dispose() {
    _audioPlayer.dispose();
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  debugPrint('🔔 Background message received');

  debugPrint('Title: ${message.notification?.title}');

  debugPrint('Body: ${message.notification?.body}');
}

//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class NotificationService {
//   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//
//   static final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();
//
//   static final AudioPlayer _audioPlayer = AudioPlayer();
//
//   static bool _isPlaying = false;
//   static bool _isSoundEnabled = true;
//
//   static const String channelId = 'school_bell_channel';
//
//   static const String channelName = 'School Bell Notifications';
//
//   static Future<void> initialize() async {
//     await _messaging.requestPermission(alert: true, badge: true, sound: true);
//
//     final token = await _messaging.getToken();
//
//     debugPrint("🔥 FCM TOKEN: $token");
//
//     final prefs = await SharedPreferences.getInstance();
//
//     await prefs.setString('fcmToken', token ?? '');
//
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       channelId,
//       channelName,
//       description: 'New order notifications',
//       importance: Importance.max,
//       playSound: true,
//       enableVibration: true,
//       sound: RawResourceAndroidNotificationSound('school_bell'),
//     );
//
//     await _localNotifications
//         .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin
//         >()
//         ?.createNotificationChannel(channel);
//
//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const InitializationSettings initSettings = InitializationSettings(
//       android: androidSettings,
//     );
//
//     await _localNotifications.initialize(initSettings);
//
//     await _audioPlayer.setReleaseMode(ReleaseMode.loop);
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       debugPrint("🔔 FOREGROUND MESSAGE RECEIVED");
//
//       await _showNotification(message);
//
//       await _playOrderSound();
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       await _stopSound();
//     });
//   }
//
//   static Future<void> _playOrderSound() async {
//     if (!_isSoundEnabled || _isPlaying) {
//       return;
//     }
//
//     try {
//       _isPlaying = true;
//
//       debugPrint("🔊 PLAYING SCHOOL BELL");
//
//       await _audioPlayer.play(AssetSource('school-bell-310293.mp3'));
//     } catch (e) {
//       debugPrint("❌ Sound Error: $e");
//
//       _isPlaying = false;
//     }
//   }
//
//   static Future<void> _stopSound() async {
//     if (!_isPlaying) return;
//
//     await _audioPlayer.stop();
//
//     _isPlaying = false;
//   }
//
//   static Future<void> _showNotification(RemoteMessage message) async {
//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//           channelId,
//           channelName,
//           importance: Importance.max,
//           priority: Priority.max,
//           playSound: true,
//           enableVibration: true,
//           sound: RawResourceAndroidNotificationSound('school_bell'),
//         );
//
//     const NotificationDetails details = NotificationDetails(
//       android: androidDetails,
//     );
//
//     await _localNotifications.show(
//       DateTime.now().millisecondsSinceEpoch,
//       message.notification?.title ?? "New Order",
//       message.notification?.body ?? "You have a new order",
//       details,
//       payload: "order",
//     );
//   }
//
//   static Future<void> showLocalNotification({
//     required String title,
//     required String body,
//     String? payload,
//   }) async {
//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//           channelId,
//           channelName,
//           importance: Importance.max,
//           priority: Priority.max,
//           playSound: true,
//           enableVibration: true,
//           sound: RawResourceAndroidNotificationSound('school_bell'),
//         );
//
//     const NotificationDetails details = NotificationDetails(
//       android: androidDetails,
//     );
//
//     await _localNotifications.show(
//       DateTime.now().millisecondsSinceEpoch,
//       title,
//       body,
//       details,
//       payload: payload ?? 'order',
//     );
//   }
//
//   static Future<void> triggerOrderSound() async {
//     await _playOrderSound();
//   }
//
//   static Future<void> stopOrderSound() async {
//     await _stopSound();
//   }
//
//   static void toggleSound(bool enabled) {
//     _isSoundEnabled = enabled;
//
//     if (!enabled) {
//       _stopSound();
//     }
//   }
//
//   static void dispose() {
//     _audioPlayer.dispose();
//   }
// }
//
// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//
//   debugPrint('🔔 Background message received');
//
//   debugPrint('Title: ${message.notification?.title}');
//
//   debugPrint('Body: ${message.notification?.body}');
//
//   await NotificationService.showLocalNotification(
//     title: message.notification?.title ?? "New Order",
//     body: message.notification?.body ?? "You have a new order",
//   );
// }
