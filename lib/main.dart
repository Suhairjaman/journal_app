import 'package:flutter/material.dart';
import 'package:journal_app/screens/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {

WidgetsFlutterBinding.ensureInitialized();
await  Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Journal App',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
     home: HomeScreen(),
    );
  }
}
