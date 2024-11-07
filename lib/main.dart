import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system_clock/provider/navigationprovider.dart';
import 'package:system_clock/provider/themeprovider.dart';
import 'package:system_clock/view/aboutclock.dart';
import 'package:system_clock/view/clock2.dart';
import 'package:system_clock/view/datetime.dart';
import 'package:system_clock/view/homepage.dart';
import 'package:system_clock/view/opensource.dart';
import 'package:system_clock/view/privacy.dart';
import 'package:system_clock/view/privacypolicy.dart';
import 'package:system_clock/view/settings.dart';
import 'package:system_clock/view/splashscreen.dart';
import 'package:system_clock/view/stopalarm.dart';
import 'package:system_clock/view/timezone.dart';

void main() {
  runApp(MyApp(),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ThemeProvider()),
        ChangeNotifierProvider(create: (context)=>NavigationProvider()),
      ],
      builder:(context,child){
        return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.currentTheme,
            debugShowCheckedModeBanner: false,
            routes: {
              "/": (context) => Splash_Screen(),
              "home": (context) => Home_Page(),
              "setting": (context) => Settings(),
              "stopalarm": (context) => Stop_Alarm(),
              "datetime": (context) => Date_Time(),
              "clock2": (context) => Clock2(),
              "aboutclock": (context) => About_Clock(),
              "opensource": (context) => Open_Source(),
              "privacy": (context) => Privacy(),
              "privacypolicy": (context) => Privacy_Policy(),
              "timezone": (context) => TimeZone(),
            },
          );
        });
      }
    );
  }
}