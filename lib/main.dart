import 'package:flutter/material.dart';
import 'package:insurancetech/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insurancetech/routes.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insurance Tech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        initialRoute: '/checar',
        routes: instanceRoutes(context)

    );
  }
}

