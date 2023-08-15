import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:market/pages/login_page.dart';
import 'package:market/pages/sing_up_page.dart';
import 'package:market/pages/startup_page.dart';
import 'package:market/startup_page/introduction_page.dart';

import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        StartupPage.id: (context) =>  const StartupPage(),
        SingUpPage.id: (context) => const SingUpPage(),
      },
      home:  const IntroPage(),
    );
  }
}

