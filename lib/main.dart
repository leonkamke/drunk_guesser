import 'package:drunk_guesser/screens/categories_screen.dart';
import 'package:drunk_guesser/screens/credits_screen.dart';
import 'package:drunk_guesser/screens/home_screen.dart';
import 'package:drunk_guesser/screens/rules_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      home: HomeScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == "/credits") {
          return PageRouteBuilder(
          settings: settings,
          // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
          pageBuilder: (context, animation, secondaryAnimation) =>
          const CreditsScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 110),
        reverseTransitionDuration: const Duration(milliseconds: 110)
        );
        } else if (settings.name == "/rules") {
          return PageRouteBuilder(
            settings: settings,
            // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
            pageBuilder: (context, animation, secondaryAnimation) =>
            const RulesScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 110),
            reverseTransitionDuration: const Duration(milliseconds: 110)
          );
        } else if (settings.name == "/categories") {
          return PageRouteBuilder(
              settings: settings,
              // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
              pageBuilder: (context, animation, secondaryAnimation) =>
              const CategoriesScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 180),
              reverseTransitionDuration: const Duration(milliseconds: 180)
          );
        }
        return null;
      },
    );
  }

}
