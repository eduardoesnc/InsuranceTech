import 'package:flutter/material.dart';
import 'package:insurancetech/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insurancetech/routes.dart';
import 'checklist_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
          primaryColor: const Color(0xFF2a5298),
        ),
        initialRoute: '/checar',
        routes: instanceRoutes(context)
    );
  }
}
<<<<<<< HEAD
=======


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Aplicativo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChecklistPage(),
    );
  }
}

>>>>>>> 3b0954c (Craição da tela de checklist)
