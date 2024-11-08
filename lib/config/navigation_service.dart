import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupRouter() {
  locator.registerLazySingleton(() => NavigationService());
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}