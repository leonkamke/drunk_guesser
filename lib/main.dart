import 'package:drunk_guesser/provider/categories_startbutton_provider.dart';
import 'package:drunk_guesser/provider/textfield_provider.dart';
import 'package:drunk_guesser/screens/categories_screen.dart';
import 'package:drunk_guesser/screens/credits_screen.dart';
import 'package:drunk_guesser/screens/game_end_screen.dart';
import 'package:drunk_guesser/screens/game_screen.dart';
import 'package:drunk_guesser/screens/game_start_screen.dart';
import 'package:drunk_guesser/screens/home_screen.dart';
import 'package:drunk_guesser/screens/rules_screen.dart';
import 'package:drunk_guesser/screens/settings_screen.dart';
import 'package:drunk_guesser/screens/shop_bundles_screen.dart';
import 'package:drunk_guesser/screens/shop_categories_screen.dart';
import 'package:drunk_guesser/screens/shop_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'api/purchase_api.dart';


Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // RevenueCat-purchases
  try {
    await PurchaseApi.init();
  } catch(e) {

  }
  // Google ads (Admob)
  MobileAds.instance.initialize();
  // Splashscreen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Only portrait mode
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // Start App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TextFieldProvider()),
        ChangeNotifierProvider(create: (_) => StartButtonProvider()),
      ],
      child: MaterialApp(
        title: 'DrunkGuesser',
        home: HomeScreen(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        onGenerateRoute: (settings) {
          if (settings.name == "/home") {
            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child,);
                },
                transitionDuration: const Duration(milliseconds: 25),
                reverseTransitionDuration: const Duration(milliseconds: 25));
          } else if (settings.name == "/credits") {
            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CreditsScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 25),
                reverseTransitionDuration: const Duration(milliseconds: 25));
          } else if (settings.name == "/rules") {
            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    RulesScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 25),
                reverseTransitionDuration: const Duration(milliseconds: 25));
          } else if (settings.name == "/categories") {
            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CategoriesScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 25),
                reverseTransitionDuration: const Duration(milliseconds: 25));
          } else if (settings.name == "/settings") {
            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SettingsScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 25),
                reverseTransitionDuration: const Duration(milliseconds: 25));
          } else if (settings.name == "/shop_main") {
            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ShopMainScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.linear;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 200),
                reverseTransitionDuration: const Duration(milliseconds: 200));
          } else if (settings.name == "/shop_category") {
            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ShopCategoriesScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 25),
                reverseTransitionDuration: const Duration(milliseconds: 25));
          } else if (settings.name == "/shop_bundles") {
            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ShopBundlesScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 25),
                reverseTransitionDuration: const Duration(milliseconds: 25));
          } else if (settings.name == "/game_start") {
            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    GameStartScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 240),
                reverseTransitionDuration: const Duration(milliseconds: 240));
          } else if (settings.name == "/game") {
            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    GameScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 5),
                reverseTransitionDuration: const Duration(milliseconds: 5));
          } else if (settings.name == "/game_end") {
            /*
            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    GameEndScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 500),
                reverseTransitionDuration: const Duration(milliseconds: 500));*/

            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    GameEndScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, -1.0);
                  const end = Offset.zero;
                  const curve = Curves.bounceOut;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 700),
                reverseTransitionDuration: const Duration(milliseconds: 700));
          } else if (settings.name == "/") {
            return PageRouteBuilder(
                settings: settings,
                // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                pageBuilder: (context, animation, secondaryAnimation) =>
                    HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 55),
                reverseTransitionDuration: const Duration(milliseconds: 55));
          }
          return null;
        },
      ),
    );
  }

/*
  Code for fade - pagetransition:

  return PageRouteBuilder(
              settings: settings,
              // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
              pageBuilder: (context, animation, secondaryAnimation) =>
                  CreditsScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 55),
              reverseTransitionDuration: const Duration(milliseconds: 55));

   Swipe transition:

   return PageRouteBuilder(
              settings: settings,
              // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
              pageBuilder: (context, animation, secondaryAnimation) =>
                  CategoriesScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 180),
              reverseTransitionDuration: const Duration(milliseconds: 180));
   */
}
