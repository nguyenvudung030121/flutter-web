import 'package:adaptive_theme/adaptive_theme.dart' show AdaptiveTheme, AdaptiveThemeMode;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'config/config.dart';
import 'package:flutter_web_plugins/url_strategy.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(MyApp(savedThemeMode: savedThemeMode ?? AdaptiveThemeMode.light));

}

class MyApp extends StatefulWidget {
  final AdaptiveThemeMode savedThemeMode;
  const MyApp({Key? key, required this.savedThemeMode}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoRouter _router;

  @override
  void initState() {
    _router = GoRouter(
      initialLocation: HomeRoute().location,
      debugLogDiagnostics: true,
      routes: $appRoutes,
      redirect: (context, state) {
        return null;
      },
    );
    super.initState();
  }

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
      initial: widget.savedThemeMode,
      builder: (theme, darkTheme) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Madison Technologies',
        theme: theme,
        darkTheme: darkTheme,
        routerConfig: _router,
      ),
    );
  }
}
