import 'package:flutter/material.dart';
import 'package:insurancetech/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insurancetech/routes.dart';
import 'package:provider/provider.dart';
import 'package:insurancetech/services/auth.service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AuthService()),
          ],
      child: const MyApp()
      )
  );
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