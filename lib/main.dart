import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'component/component.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode ?? AdaptiveThemeMode.light));

}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;
  const MyApp({Key? key, required this.savedThemeMode}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(brightness: Brightness.light),
      ),
      dark: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(brightness: Brightness.dark),
      ),
      initial: savedThemeMode,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Madison Technologies',
        theme: theme,
        darkTheme: darkTheme,
        home: LayoutTemplate(),
      ),
    );
  }
}
