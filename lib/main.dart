import 'package:app_igreja/home.dart';
import 'package:app_igreja/introduction.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool shouldShowIntro = !(prefs.getBool('skipIntro') ?? false);

  // Configurar as notificações
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = IOSInitializationSettings();
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(MyApp(shouldShowIntro: shouldShowIntro));
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool shouldShowIntro;
  const MyApp({Key? key, required this.shouldShowIntro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo IPB Alegre',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: shouldShowIntro ? IntroductionScreenPage() : HomePage(),
    );
  }
}
