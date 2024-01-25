// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:game/firebase_options.dart';
import 'package:game/game/car_race.dart';
import 'package:game/game/utils/color_theme.dart';
import 'package:game/game/widgets/game_over_overlay.dart';
import 'package:game/game/widgets/game_overlay.dart';
import 'package:game/game/widgets/main_menu_overlay.dart';
import 'package:game/splash_screen.dart';
import 'package:shared_value/shared_value.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>() !=
      null) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();
  }

  var initializationSettings;
  if (Platform.isAndroid) {
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
        'high_importance_channel', 'xxxx',
        importance: Importance.max);
    var initializationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannel(channel);

    initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
  } else {
    var initializationSettingsIOS = const DarwinInitializationSettings();
    initializationSettings =
        InitializationSettings(iOS: initializationSettingsIOS);
  }
  flutterLocalNotificationsPlugin.initialize(initializationSettings);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    RemoteNotification notification = message.notification!;
    print('notificationnnnnnnn ${notification.title}');

    if (Platform.isAndroid) {
      AndroidNotification androidNotification = message.notification!.android!;
      if (androidNotification != null) {
        var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
            'high_importance_channel', 'xxxx',
            importance: Importance.max,
            playSound: true,
            showProgress: true,
            priority: Priority.high,
            ticker: 'test ticker');

        var iOSChannelSpecifics = const DarwinNotificationDetails();
        var platformChannelSpecifics = NotificationDetails(
            android: androidPlatformChannelSpecifics, iOS: iOSChannelSpecifics);
        // Vibration.vibrate(duration: 1000, amplitude: 128);
        await flutterLocalNotificationsPlugin.show(
            0, notification.title, notification.body, platformChannelSpecifics,
            payload: 'test');
      }
    } else if (Platform.isIOS) {
      var iOSChannelSpecifics = const DarwinNotificationDetails();
      var platformChannelSpecifics =
          NotificationDetails(iOS: iOSChannelSpecifics);
      // Vibration.vibrate(duration: 1000, amplitude: 128);
      await flutterLocalNotificationsPlugin.show(
          0, notification.title, notification.body, platformChannelSpecifics,
          payload: 'test');
    }
  });
  runApp(
    SharedValue.wrapApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mega68GB',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.audiowideTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

final Game game = CarRace();

class CarRaceHomePage extends StatelessWidget {
  const CarRaceHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !Navigator.of(context).userGestureInProgress;
      },
      child: Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.background,

        body: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            return Container(
              constraints: const BoxConstraints(
                maxWidth: 800,
                minWidth: 550,
              ),
              child: GameWidget(
                game: game,
                overlayBuilderMap: <String,
                    Widget Function(BuildContext, Game)>{
                  'gameOverlay': (context, game) => GameOverlay(game),
                  'mainMenuOverlay': (context, game) => MainMenuOverlay(game),
                  'gameOverOverlay': (context, game) => GameOverOverlay(game),
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
