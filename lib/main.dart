import 'package:eventlly/auth/screen/login_screen.dart';
import 'package:eventlly/auth/screen/signup_screen.dart';
import 'package:eventlly/common/app_theme.dart';
import 'package:eventlly/events/create_event_page.dart';
import 'package:eventlly/firebase_options.dart';
import 'package:eventlly/home/main_layer_Screen.dart';
import 'package:eventlly/provideres/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
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
      title: 'Flutter Demo',
      theme: AppTheme.lightThem,
      darkTheme: AppTheme.darkThem,
      themeMode: context.watch<ThemeProvider>().themeMode,
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        MainLayerScreen.routeName: (_) => MainLayerScreen(),
        CreateEventPage.routeName: (_) => CreateEventPage(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
