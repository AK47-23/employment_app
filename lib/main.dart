import 'package:employment_app/screens/homepage.dart';
import 'package:employment_app/utilities/fonts.dart';
import 'package:employment_app/utilities/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employement App',
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}
