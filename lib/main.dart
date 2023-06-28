import 'package:education/Manager/ColourStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Manager/AppState.dart';
import 'View/DispatchView.dart';

/*
For run in web run below command:
flutter run -d chrome --web-browser-flag "--disable-web-security"
*/

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
          useMaterial3: true,
          //primarySwatch: ColourStyle.white,
          textTheme: TextTheme(
              headlineMedium: TextStyle(
                  color: Theme.of(context).colorScheme.label,
                  fontWeight: FontWeight.bold))),
      home: const DispatchView(),
      darkTheme: ThemeData.dark(), // standard dark theme
      themeMode: ThemeMode.dark,
    );
  }
}
