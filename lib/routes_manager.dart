import 'package:flutter/material.dart';
import 'package:note_it/view/widgets/login_screen.dart';
import 'package:note_it/view/widgets/my_note_view_body.dart';
import 'package:note_it/view/widgets/my_notes.dart';
import 'package:note_it/view/widgets/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String myNotesRoute = '/mynotes';
  static const String myNotesViewBodyRoute = '/mynotesBody';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
    switch (settings.name) {
      case Routes.myNotesRoute:
        return MaterialPageRoute(builder: (_) => const MyNotesPage());
    }
    switch (settings.name) {
      case Routes.myNotesViewBodyRoute:
        return MaterialPageRoute(builder: (_) => const NoteViewBody());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text('No routes founded')),
              body: const Center(child: Text('No routes founded')),
            ));
  }
}
